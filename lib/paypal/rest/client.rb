require 'faraday'
require 'faraday_middleware'
require 'json'
require 'hashie'

require_relative 'client/errors'
require_relative 'client/endpoints'
require_relative 'client/request'
require_relative 'client/version'

module Paypal
  module Rest
    class Client
      attr_accessor :api_key, :debug

      include Paypal::Rest::Client::Request
      include Paypal::Rest::Client::Endpoints

      def initialize(token=nil, sandbox=false)
        @token = token
        @sandbox = sandbox
      end
    end
  end
end
