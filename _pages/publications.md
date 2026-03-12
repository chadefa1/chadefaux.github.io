---
layout: page
permalink: /publications/
title: publications
description: Publications in reverse chronological order.
nav: true
nav_order: 2
---

<div class="publications">
  {% assign pubs = site.data.publications | sort: 'year' | reverse %}
  {% assign current_year = '' %}
  {% for p in pubs %}
    {% if p.year and p.year != current_year %}
      <h3 style="margin-top:1.2rem;">{{ p.year }}</h3>
      {% assign current_year = p.year %}
    {% endif %}
    <div class="pub-item" style="margin-bottom: 0.6rem;">
      <div>
        {% if p.link %}
          <a href="{{ p.link }}" target="_blank" rel="noopener">{{ p.title }}</a>
        {% else %}
          {{ p.title }}
        {% endif %}
      </div>
      <div class="pub-meta" style="font-size:0.95rem; color:#555;">
        {% if p.author %}{{ p.author }}{% endif %}
        {% if p.journal %} · <em>{{ p.journal }}</em>{% endif %}
        {% if p.volume %} {{ p.volume }}{% endif %}
        {% if p.number %}({{ p.number }}){% endif %}
        {% if p.pages %} {{ p.pages }}{% endif %}
      </div>
    </div>
  {% endfor %}
</div>
