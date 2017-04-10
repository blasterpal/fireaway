module Fireaway
  module Adapters
    class Abstract 

      ADAPTERS = {
        http: 'Http',
        amqp: 'Amqp'
      }

      attr_accessor \
        :options


      def initialize(options={})
        @options = options
      end

      def publish(message,tries=0)
        raise InterfaceError
      end      
      def consume(message)
        raise InterfaceError
      end

      def pause_message
        raise InterfaceError
      end

      def save_failure(message)
        raise InterfaceError
      end

      def retriable?
        raise InterfaceError
      end
    end
  end
end
