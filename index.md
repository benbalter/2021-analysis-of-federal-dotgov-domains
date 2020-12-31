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
{%- assign num_proper_404s = site.domains | where: "checks.content.proper_404s", true | size -%}
{%- assign num_vulnerability_disclosure_policy = site.domains | where: "checks.content.vulnerability_disclosure_policy", true | size -%}
{%- assign num_data_json = site.domains | where: "checks.content.data_json", true | size -%}
{%- assign num_akamai = site.domains | where_exp:"domain", "domain.checks.wappalyzer.cdn contains 'Akamai'" | size -%}
{%- assign num_cloudfront = site.domains | where_exp:"domain", "domain.checks.wappalyzer.cdn contains 'Amazon Cloudfront'" | size -%}

Download the raw data as [CSV]({{ "data.csv" | relative_url }}), or [JSON]({{ "data.json" | relative_url }}), see a [breakdown by technology]({{ "technologies/" | relative_url }}), or view detailed results for any individual domain using the search box above.

### Highlights 

* **Overall** - There are {{ num_domains }} federally-managed .gov domains. That's about 250 fewer than there was five years ago. Of those domains, {% include num-with-percent.html num=num_live_domains denom=num_domains %} are live. That's about the same percentage as we saw in 2014 and 2015, and has gone up about 10% over the past 10 years.
* **Redirects** - {% include num-with-percent.html num=num_redirect denom=num_live_domains %} domains simply redirect to another domain.
* **www** - Of those live domains, {% include num-with-percent.html num=num_root denom=num_live_domains %} are reachable without the `www.` prefix. That's 20 fewer than in 2015, but about a 17% increase.
* **HTTPS** - {% include num-with-percent.html num=num_https denom=num_live_domains %} domains support HTTPS, a 2.5x increase since the last analysis, and an incredible jump from the one in four we last saw. Even more surprisingly {% include num-with-percent.html num=num_enforces_https denom=num_live_domains %} _enforce_ HTTPS, up from one in 10 last time. {% include num-with-percent.html num=num_hsts denom=num_domains %} support HSTS, with {% include num-with-percent.html num=num_hsts_preloaded denom=num_domains %} .govs on the HSTS preload list.
* **CMS** - Of those live, non-redirected domains, {% include num-with-percent.html num=305 denom=num_live_domains %} had a detectable CMS (up from 13% in 2015). Of them, {% include num-with-percent.html num=251 denom=305 %} relied on an open source CMS. {% include num-with-percent.html num=num_drupal denom=num_live_non_redirect_domains %} domains use the Drupal CMS, up from 10% in 2015. Usage of WordPress doubled in percentage going from 29 to {% include num-with-percent.html num=num_wp denom=num_live_domains %} sites since 2015. Joomla usage went from 8 to {% include num-with-percent.html num=num_joomla denom=num_live_domains %} domains.
* **Analytics** - {% include num-with-percent.html num=num_ga denom=num_live_non_redirect_domains %} unique domains use Google Analytics. Up from about one in four in 2014 and just 86 ten years ago.
* **Host** - It's not always possible to detect the hosting provider, but at least {% include num-with-percent.html num=num_aws denom=num_live_domains %} live domains use AWS (up from just 10 in 2011), {% include num-with-percent.html num=num_azure denom=num_live_domains %} uses Azure, and {% include num-with-percent.html num=num_ghp denom=num_live_domains %} uses GitHub Pages.
* **Mail** - In terms of mail providers, {% include num-with-percent.html num=num_o365 denom=num_domains %} use Office 365 and {% include num-with-percent.html num=num_gsuite denom=num_domains %} use GSuite.
* **Open source** - {% include num-with-percent.html num=541 denom=num_live_domains %} of live domains used some form of detectable open source software (operating system, server, or framework), meaning overall, federal domains relied on 2.8 open source projects on average, with those relying on at least one open source project relying on just shy of 5 open source projects on average.
* **Common files** - {% include num-with-percent.html num=num_proper_404s denom=num_live_non_redirect_domains %} domains return proper 404s, making it possible to check for the existence of certain files. Of them, {% include num-with-percent.html num=num_vulnerability_disclosure_policy denom=num_proper_404s %} have a vulnerability disclosure policy and {% include num-with-percent.html num=num_data_json denom=num_proper_404s %} have a `data.json` file.
* **IPV6** - {% include num-with-percent.html num=num_ipv6 denom=num_live_domains %} domains returned a `AAAA` record, indicating they supported IPv6 traffic.
* **DNSSEC** - {% include num-with-percent.html num=num_dnssec denom=num_domains %} domains returned a DNSSEC record.
* **CDN** - {% include num-with-percent.html num=num_akamai denom=num_live_non_redirect_domains %} use the Akamai content distribution network and {% include num-with-percent.html num=num_cloudfront denom=num_live_non_redirect_domains %} use Amazon Cloudfront.
  
### Methodology

The General Services Administration maintains [a publicly available list](https://github.com/GSA/data/tree/master/dotgov-domains) of all registered `.gov` domains. This analysis is the result of running the open source tool [site inspector](https://github.com/benbalter/site-inspector) on every Federal domain on that list and aggregating the results. For each domain, site inspector makes a series of (public) HTTP(S) and DNS calls and a headless browser to gather information about the response and attempt to learn more about the server's technologies and capabilities.