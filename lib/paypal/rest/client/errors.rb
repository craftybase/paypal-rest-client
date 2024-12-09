module Paypal
  module Rest
    class Client
      class AuthError            < StandardError; end
      class InvalidRequestError  < StandardError; end
      class NotFoundError        < StandardError; end
      class InvalidToken         < StandardError; end
      class TooManyRequestsError < StandardError; end
      class Error                < StandardError; end
    end
  end
end
