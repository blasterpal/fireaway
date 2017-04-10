module Fireaway
  module Adapters
    class Http < Abstract

      attr_accessor :http_client,
        :message_cache

      def initialize(options={})
        super(options)
        @http_client = SomeHTTPClass.new
        @message_cache = MessageCache
      end

      def publish(message,tries=0)
        with_tries do
          http_client.post(message) 
        end
      end      
      def consume(message)
        # this occurs elsewhere for HTTP, as it's in stack or does this create a special set of RACK endpoints for app?
      end

      def pause_message
        raise InterfaceError
      end

      def save_failure(message)
        MessageCache.create(worker_klass: 
      end

      def retriable?
        raise InterfaceError
      end
    end
  end
end
