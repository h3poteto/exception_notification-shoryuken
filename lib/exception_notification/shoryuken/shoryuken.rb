require 'shoryuken'
require 'exception_notifier'

module ExceptionNotification
  module Shoryuken
    class ExceptionNotificationMiddleware
      def call(worker, queue, sqs_msg, body)
        begin
          yield
        rescue Exception => exception
          ExceptionNotifier.notify_exception(exception, :data => { :sqs_msg => sqs_msg })
          raise exception
        end
      end
    end
  end
end

Shoryuken.configure_server do |config|
  config.server_middleware do |chain|
    chain.add ExceptionNotification::Shoryuken::ExceptionNotificationMiddleware
  end
end
