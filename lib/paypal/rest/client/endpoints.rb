require_relative 'endpoints/identity'
require_relative 'endpoints/invoices'
require_relative 'endpoints/products'
require_relative 'endpoints/transactions'

module Paypal
  module Rest
    class Client
      module Endpoints
        include Identity
        include Invoices
        include Products
        include Transactions
      end
    end
  end
end
