require 'csv'

module Jekyll
  module CSVify
    CHECKS_TO_EXCLUDE = %w[whois headers wappalyzer].freeze

    def csvify(documents)
      CSV.generate do |csv|
        headers = []
        headers << 'domain_name'
        headers << 'agency'
        headers << documents.first['domain'].keys.map { |k| "domain_#{k}" }
        headers << documents.first['canonical_endpoint'].keys.map { |k| "canonical_endpoint_#{k}" }
        documents.first['checks'].each do |check, hash|
          next if CHECKS_TO_EXCLUDE.include?(check)

          headers << hash.keys.map { |key| "#{check}_#{key}" }
        end
        csv << headers.flatten

        documents.each do |document|
          row = []
          row << document['domain_name']
          row << document['agency']
          row << document['domain'].values
          row << document['canonical_endpoint'].values
          document['checks'].each do |check, hash|
            next if CHECKS_TO_EXCLUDE.include?(check)

            row << hash.values
          end

          csv << row.flatten
        end
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::CSVify)
