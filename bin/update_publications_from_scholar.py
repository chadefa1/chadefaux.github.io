#!/usr/bin/env python

"""
Update _data/publications.yml with new items from a Google Scholar profile.

Behavior:
- Reads Google Scholar user ID from _data/socials.yml (key: scholar_userid).
- Fetches author publications via `scholarly`.
- Compares titles against existing entries in _data/publications.yml.
- Appends any new publications with best-effort metadata.

Notes:
- Only appends new items; does not rewrite existing ones.
- Attempts to fetch detailed fields (venue, link, volume, pages) only for new items
  to minimize requests.
- Designed to run in GitHub Actions on a schedule or manual dispatch.
"""

from __future__ import annotations

import os
import re
import sys
from datetime import datetime
from typing import Any, Dict, List

import yaml
from scholarly import scholarly


SOCIALS_FILE = "_data/socials.yml"
PUBLICATIONS_FILE = "_data/publications.yml"


def load_scholar_user_id() -> str:
    if not os.path.exists(SOCIALS_FILE):
        print(f"❌ {SOCIALS_FILE} not found. Add your Google Scholar ID there (scholar_userid).")
        sys.exit(1)
    try:
        with open(SOCIALS_FILE, "r", encoding="utf-8") as f:
            cfg = yaml.safe_load(f) or {}
        scholar_user_id = cfg.get("scholar_userid")
        if not scholar_user_id:
            print("❌ Missing 'scholar_userid' in _data/socials.yml.")
            sys.exit(1)
        return str(scholar_user_id).strip()
    except Exception as e:
        print(f"❌ Failed reading {SOCIALS_FILE}: {e}")
        sys.exit(1)


def load_existing_publications() -> List[Dict[str, Any]]:
    if not os.path.exists(PUBLICATIONS_FILE):
        return []
    try:
        with open(PUBLICATIONS_FILE, "r", encoding="utf-8") as f:
            data = yaml.safe_load(f)
        if data is None:
            return []
        if not isinstance(data, list):
            print(f"⚠️ {PUBLICATIONS_FILE} is not a YAML list. Aborting to avoid corruption.")
            sys.exit(1)
        return data
    except Exception as e:
        print(f"❌ Failed reading {PUBLICATIONS_FILE}: {e}")
        sys.exit(1)


def normalize_title(title: str) -> str:
    t = (title or "").lower()
    t = re.sub(r"\s+", " ", t).strip()
    # Remove punctuation and spaces for robust matching
    t = re.sub(r"[^a-z0-9]", "", t)
    return t


def slugify(name: str) -> str:
    s = (name or "").lower()
    s = re.sub(r"[^a-z0-9]+", "-", s).strip("-")
    return s


def authors_to_string(bib_authors: Any) -> str:
    # scholarly typically returns a string like: "Last, First and Other, Name"
    if isinstance(bib_authors, str):
        # Replace ' and ' with ', ' for compact display
        return bib_authors.replace(" and ", ", ")
    if isinstance(bib_authors, list):
        return ", ".join(str(a) for a in bib_authors)
    return str(bib_authors or "")


def to_int_or_str(value: Any) -> Any:
    try:
        return int(str(value))
    except Exception:
        return value


def main() -> None:
    scholar_id = load_scholar_user_id()
    print(f"🔎 Fetching publications for Google Scholar ID: {scholar_id}")

    existing = load_existing_publications()
    known_titles = {normalize_title(item.get("title", "")): item for item in existing if item.get("title")}

    scholarly.set_timeout(15)
    scholarly.set_retries(3)

    try:
        author = scholarly.search_author_id(scholar_id)
        author_data = scholarly.fill(author)
    except Exception as e:
        print(f"❌ Failed to fetch author data for '{scholar_id}': {e}")
        sys.exit(1)

    pubs = author_data.get("publications", [])
    if not pubs:
        print("ℹ️ No publications found in Scholar response.")
        return

    new_items: List[Dict[str, Any]] = []
    added_count = 0

    for p in pubs:
        bib = p.get("bib", {})
        title = bib.get("title")
        if not title:
            continue
        key = normalize_title(title)
        if key in known_titles:
            continue

        # Only fill details for new items to minimize requests
        try:
            p = scholarly.fill(p)
            bib = p.get("bib", {})
        except Exception:
            # proceed with whatever we have
            pass

        year = bib.get("pub_year") or bib.get("year")
        authors = authors_to_string(bib.get("author"))
        venue = bib.get("venue") or bib.get("journal") or bib.get("citation")
        volume = bib.get("volume")
        number = bib.get("number")
        pages = bib.get("pages")

        link = (
            p.get("pub_url")
            or p.get("eprint_url")
            or bib.get("url")
        )

        # Construct a deterministic name (slug)
        base_slug = slugify(f"{str(year or '')}-{title}")
        name = base_slug[:60]  # keep it reasonably short

        item: Dict[str, Any] = {
            "name": name,
            "link": link or "",
            "title": title,
            "author": authors,
            "year": to_int_or_str(year) if year else "",
            "journal": venue or "",
            "volume": volume or "",
            "number": number or "",
            "pages": str(pages) if pages else "",
            "content": "",
            "image": "",
            "description": "",
        }

        new_items.append(item)
        added_count += 1

    if not new_items:
        print("✅ No new publications to add.")
        return

    print(f"🆕 Found {added_count} new publication(s). Appending to {PUBLICATIONS_FILE}…")
    merged = existing + new_items

    # Sort by year desc (unknown years last)
    def sort_key(d: Dict[str, Any]):
        y = d.get("year")
        try:
            return -(int(y))
        except Exception:
            return float("inf")

    merged_sorted = sorted(merged, key=sort_key)

    try:
        with open(PUBLICATIONS_FILE, "w", encoding="utf-8") as f:
            yaml.safe_dump(merged_sorted, f, sort_keys=False, allow_unicode=True, width=1000)
        print(f"💾 Updated {PUBLICATIONS_FILE} with {added_count} new item(s).")
    except Exception as e:
        print(f"❌ Failed writing {PUBLICATIONS_FILE}: {e}")
        sys.exit(1)


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print(f"Unexpected error: {e}")
        sys.exit(1)

