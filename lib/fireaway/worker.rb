module Fireaway
  module Worker

    def self.included(base)
      base.extends ClassMethods
      def fireaway_adapter
        @@_fireaway_adapter
      end
      def fireaway_publish(message)
        validate_message!(message)
        message = before_publish(message)
        with_retries(fireaway_adapter.publish(message))
      end
      # to be overridden in class
      def before_publish(message)
        message
      end
        def validate_message!(message)
          message
        end
      def fireaway_adapter
        @@_fireaway_adapter
      end
    end
  end
  module ClassMethods
    attr_reader :fireaway_configuration
    def fireaway(adapter,options={})
      @@_fireaway_configuration = options
      @@_fireaway_adapter = Module.const_get(Fireaway::Adapters::ADAPTERS[adapter]).new(options)
    end
  end
end
