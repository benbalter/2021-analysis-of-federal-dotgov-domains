require 'site-inspector'

# Jekyll plugin to use SiteInspector's key/value formatter to format domain data

module Jekyll
  module KVFormatter
    include SiteInspector::Formatter
  end
end

Liquid::Template.register_filter(Jekyll::KVFormatter)
