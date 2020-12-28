require 'csv'

# A Jekyll filter to generate a CSV given an array of domains

module Jekyll
  module CSVify
    CHECKS_TO_EXCLUDE = %w[whois headers].freeze

    def site
      @context.registers[:site]
    end

    def csvify(documents)
      CSV.generate do |csv|
        headers = []
        headers << 'domain_name'
        headers << 'agency'
        headers << 'detail_view'

        headers << site.data['fields']['domain'].map { |k| "domain_#{k}" }
        headers << site.data['fields']['canonical_endpoint'].map { |k| "canonical_endpoint_#{k}" }

        site.data['fields']['checks'].each do |check, fields|
          next if CHECKS_TO_EXCLUDE.include?(check)

          headers << fields.map { |f| "#{check}_#{f}" }
        end
        csv << headers.flatten

        documents.each do |document|
          row = []
          row.push document['domain_name']
          row.push document['agency']
          row.push document['url']

          site.data['fields']['domain'].each do |field|
            row.push document['domain'][field]
          end

          site.data['fields']['canonical_endpoint'].each do |field|
            row.push document['canonical_endpoint'][field]
          end

          site.data['fields']['checks'].each do |check, fields|
            next if CHECKS_TO_EXCLUDE.include?(check)

            fields.each do |field|
              data = document['checks'][check][field]
              data = data.join(' and ') if data.is_a?(Array)
              row.push data
            end
          end

          csv << row
        end
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::CSVify)
