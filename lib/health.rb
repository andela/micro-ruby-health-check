require 'grpc'
require 'thread'
require_relative './health_services_pb'


module Grpc
  # Health contains classes and modules that support providing a health check
  # service.
  module Health
    # Checker is implementation of the schema-specified health checking service.
    class Checker < V1::Health::Service
      StatusCodes = GRPC::Core::StatusCodes
      HealthCheckResponse = V1::HealthCheckResponse

      # Initializes the statuses of participating services
      def initialize
        @statuses = {}
        @status_mutex = Mutex.new  # guards access to @statuses
      end

      # Implements the rpc IDL API method
      def check(req, _call)
        status = nil
        @status_mutex.synchronize do
          status = @statuses["#{req.service}"]
        end
        if status.nil?
          fail GRPC::BadStatus.new_status_exception(StatusCodes::NOT_FOUND)
        end
        HealthCheckResponse.new(status: status)
      end

      # Adds the health status for a given service.
      def add_status(service, status)
        @status_mutex.synchronize { @statuses["#{service}"] = status }
      end

      # Clears the status for the given service.
      def clear_status(service)
        @status_mutex.synchronize { @statuses.delete("#{service}") }
      end

      # Clears alls the statuses.
      def clear_all
        @status_mutex.synchronize { @statuses = {} }
      end
    end
  end
end
