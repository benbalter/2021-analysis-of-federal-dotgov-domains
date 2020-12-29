# Analysis of federal .gov domains

## How things are wired up

This is a Jekyll site, with a few custom plugins. It uses [Site Inspector](https://github.com/benbalter/site-inspector) to gather information about domains.

### Crawling

1. `script/fetch-domain-list` will fetch the latest .gov domain list from GSA
2. `script/crawl` will iterate over each domain, running Site Inspector to capture data
3. Once all domains are crawled, `script/dump-fields` parses some additional metadata necessary for the site to work.

### Data storage

* Crawled domains are stored in the `_domains` directory as `_domains/DOMAIN-GOV.html`.
* Crawl data is stored as YAML front matter within each domain.
* Some additional metadata (the raw domain list, field names, technologies in use), is stored as JSON in the `_data` directory.
* `data.json` and `data.csv` are generated at build time, and contain the complete dataset. They are available in the `_site` folder after running `script/server`.

## Running locally

1. Clone the repo
2. `script/bootstrap` to install dependencies
3. `script/server` to boot up the server and open the site in your browser
  
