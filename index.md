---
permalink: /
layout: default
---

{%- assign num_domains = site.domains | size -%}
{%- assign num_live_domains = site.domains | where: "domain.up", true | size -%}
{%- assign num_live_non_redirect_domains = site.domains | where: "domain.up", true |  where: "domain.redirect", false | size -%}
{%- assign num_root = site.domains | where: "domain.root", true | size -%}
{%- assign num_ipv6 = site.domains | where: "checks.dns.ipv6", true | size -%}
{%- assign num_https = site.domains | where: "domain.https", true | size -%}
{%- assign num_enforces_https = site.domains | where: "domain.enforces_https", true | size -%}
{%- assign num_redirect = site.domains | where: "domain.redirect", true | size -%}
{%- assign num_hsts = site.domains | where: "checks.hsts.valid", true | size -%}
{%- assign num_hsts_preloaded = site.domains | where: "checks.hsts.preload_list_status", "preloaded" | size -%}
{%- assign num_dnssec = site.domains | where: "checks.dns.dnssec", true | size -%}
{%- assign num_wp = site.domains | where_exp:"domain", "domain.checks.wappalyzer.cms contains 'WordPress'" | size -%}
{%- assign num_drupal = site.domains | where_exp:"domain", "domain.checks.wappalyzer.cms contains 'Drupal'" | size -%}
{%- assign num_joomla = site.domains | where_exp:"domain", "domain.checks.wappalyzer.cms contains 'Joomla'" | size -%}
{%- assign num_ga = site.domains | where_exp:"domain", "domain.checks.wappalyzer.analytics contains 'Google Analytics'" | size -%}
{%- assign num_aws = site.domains | where_exp:"domain", "domain.checks.wappalyzer.paas contains 'Amazon Web Services'" | size -%}
{%- assign num_azure = site.domains | where_exp:"domain", "domain.checks.wappalyzer.paas contains 'Azure'" | size -%}
{%- assign num_ghp = site.domains | where_exp:"domain", "domain.checks.wappalyzer.paas contains 'GitHub Pages'" | size -%}
{%- assign num_o365 = site.domains | where_exp:"domain", "domain.checks.wappalyzer.webmail contains 'Microsoft 365'" | size -%}
{%- assign num_gsuite = site.domains | where_exp:"domain", "domain.checks.wappalyzer.webmail contains 'Google Workspace'" | size -%}

### Highlights 

* There are {{ num_domains }} federally-managed .gov domains. That's about 250 fewer than there was five years ago. 
* Of those domains, {% include num-with-percent.html num=num_live_domains denom=num_domains %} are live. That's about the same percentage as we saw in 2014 and 2015, and has gone up about 10% over the past 10 years.
* Of those live domains, {% include num-with-percent.html num=num_root denom=num_live_domains %} are reachable without the `www.` prefix. That's 20 fewer than in 2015, but about a 17% increase.
* {% include num-with-percent.html num=num_https denom=num_live_domains %} domains support HTTPS, a 2.5x increase since the last analysis, and an incredible jump from the one in four we last saw. Even more surprisingly {% include num-with-percent.html num=num_enforces_https denom=num_live_domains %} _enforce_ HTTPS, up from one in 10 last time.
* {% include num-with-percent.html num=num_hsts denom=num_domains %} support HSTS, with {% include num-with-percent.html num=num_hsts_preloaded denom=num_domains %} .govs on the HSTS preload list.
* {% include num-with-percent.html num=num_redirect denom=num_live_domains %} domains simply redirect to another domain.
* Of those live, non-redirected domains, {% include num-with-percent.html num=num_drupal denom=num_live_non_redirect_domains %} use the Drupal CMS, up from 10% in 2015. Usage of WordPress doubled in percentage going from 29 to {% include num-with-percent.html num=num_wp denom=num_live_domains %} sites since 2015. Joomla usage went from 8 to {% include num-with-percent.html num=num_joomla denom=num_live_domains %} domains.
* {% include num-with-percent.html num=num_ga denom=num_live_non_redirect_domains %} unique domains use Google Analytics. Up from about one in four in 2014.
* It's not always possible to detect the hosting provider, but at least {% include num-with-percent.html num=num_aws denom=num_live_domains %} live domains use AWS, {% include num-with-percent.html num=num_azure denom=num_live_domains %} uses Azure, and {% include num-with-percent.html num=num_ghp denom=num_live_domains %} uses GitHub Pages.
* In terms of mail providers, {% include num-with-percent.html num=num_o365 denom=num_domains %} use Office 365 and {% include num-with-percent.html num=num_gsuite denom=num_domains %} use GSuite.


To investigate:
* IPV6: {% include num-with-percent.html num=num_ipv6 denom=num_live_domains %}
* DNSSEC: {% include num-with-percent.html num=num_dnssec denom=num_domains %}
* No detectable CMS
* Open source server
* Any open source / no open source
  