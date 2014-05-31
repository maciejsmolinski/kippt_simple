# -*- encoding : utf-8 -*-
module KipptSimple

  module Feed

    class Lists
      attr_reader :json_data, :data

      def initialize data
        @json_data, @data = data, ::JSON.parse(data,  object_class: OpenStruct)
      end
    end

  end

end
