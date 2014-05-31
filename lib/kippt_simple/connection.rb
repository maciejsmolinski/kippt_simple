# -*- encoding : utf-8 -*-
module KipptSimple

  class Connection
    attr_reader :adapter

    def initialize client
      @adapter ||= ::Faraday.new(url: URL::base) do |config|
        config.adapter :excon
        config.headers['X-Kippt-Username']  = client.username
        config.headers['X-Kippt-API-Token'] = client.token
      end

      @factory ||= Feed::Factory.new self
    end

    def get uri
      @factory.create URL.new(uri)
    end
  end

end
