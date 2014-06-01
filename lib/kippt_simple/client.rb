# -*- encoding : utf-8 -*-
module KipptSimple

  class Client

    extend Forwardable
    attr_reader :username, :token

    def initialize args
      @username, @token = args.fetch(:username, ''), args.fetch(:token, '')
      raise ArgumentError.new('Username and Token cannot be empty') if @username.empty? or @token.empty?
    end

    def connection
      @connection ||= Connection.new self
    end

    def_delegator :connection, :get, :get

  end

end
