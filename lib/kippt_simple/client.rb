# -*- encoding : utf-8 -*-
module KipptSimple

  class Client

    extend Forwardable
    attr_reader :username, :token

    def initialize args
      raise ArgumentError.new('Username and token required') if args[:username].nil? or args[:token].nil? or args[:username].empty? or args[:token].empty?
      @username, @token = args[:username], args[:token]
    end

    def connection
      @connection ||= Connection.new self
    end

    def_delegator :connection, :get, :get

  end

end
