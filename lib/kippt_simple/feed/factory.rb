# -*- encoding : utf-8 -*-
module KipptSimple

  module Feed

    class Factory

      # Creates factory object, takes KipptSimple::Connection as param
      def initialize connection
        @connection ||= connection
      end

      # Returns KipptSimple::Feed::<Class> object filled with data
      def create url
        klass, content = get_klass(url), get_content(url)
        klass.new content
      end

      private

        # Return content (JSON data) from Kippt feed
        def get_content url
          @connection.adapter.get(url.full_url).body
        end

        # Returns Class based on URL resource type (e.g. KipptSimple::Feed::Lists for "Lists", KipptSimple::Feed::Unknown for "XYZ")
        def get_klass url
          KipptSimple::Feed::const_defined?(url.resource_type) ? KipptSimple::Feed::const_get(url.resource_type) : KipptSimple::Feed::Unknown
        end

    end

  end

end
