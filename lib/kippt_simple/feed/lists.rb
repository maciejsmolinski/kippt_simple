module KipptSimple

  module Feed

    class Lists
      attr_reader :json_data, :data

      def initialize data
        @json_data, @data = data, ::OpenStruct.new(::JSON.parse(data))
      end
    end

  end

end