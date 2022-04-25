---
title: About
icon: fas fa-info-circle
order: 5
---

> Collection of Docker-Compose files.
{: .prompt-tip }

{% for file in site.static_files %}
  {% if file.path contains '_includes/docker-compose' %}
<a href="{{ file.path }}">{{ file.name | remove: '.yml'}}</a>
  {% endif %}
{% endfor %}