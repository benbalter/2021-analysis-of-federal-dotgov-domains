module Jekyll
  module DataExtractor
    IGNORED_FIELDS = %w[
      date draft categories layout title slug ext tags excerpt
    ].freeze

    def extract_data(documents)
      documents.map do |doc|
        doc.data.reject do |k, _v|
          IGNORED_FIELDS.include?(k)
        end
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::DataExtractor)
