---
title: Technologies
permalink: technologies/
---

## {{ page.title }}

The following is a list of detectable technologies by category, and the number of live, non-redirect federal .gov domains they were detected on:

{%- assign num_live_non_redirect_domains = site.domains | where: "domain.up", true |  where: "domain.redirect", false | size -%}
{%- for hash in site.data.technologies %}
{% assign cat = hash[0] %}

### {{ cat | format_key }}

{% for tech in hash[1] %}
{%- assign count = site.domains | where_exp:"domain", "domain.checks.wappalyzer[cat] contains tech" | size -%}
  * {{ tech }}: {% include num-with-percent.html num=count denom=num_live_non_redirect_domains %}
{% endfor %}
{% endfor %}