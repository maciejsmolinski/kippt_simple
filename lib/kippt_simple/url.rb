# -*- encoding : utf-8 -*-
module KipptSimple

  class URL

    # Constructor (takes uri as param)
    def initialize uri
      raise ArgumentError.new('Uri required') if uri.nil? or uri.empty?
      @uri = uri
    end

    # Returns url base, e.g. 'https://kippt.com'
    def self.base
      'https://kippt.com'
    end

    # Normalizes URI, e.g. 'lists' -> '/api/lists', '/api/lists' -> '/api/lists'
    def normalize_uri
      if @uri.start_with? '/api/'
        return @uri
      else
        return "/api/#{@uri}"
      end
    end

    # Returns full api url, e.g. 'http://kippt.com/api/lists'
    def full_url
      [ self.class.base, normalize_uri ].join('')
    end

    # Determines resource type (e.g. "Lists", "Clips" etc.)
    def resource_type
      /(\/api\/(?<type>\w+)\/?)/ =~ full_url
      type.capitalize
    end

  end

end
