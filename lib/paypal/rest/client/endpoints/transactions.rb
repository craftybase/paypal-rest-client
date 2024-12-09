module Paypal
  module Rest
    class Client
      module Endpoints
        module Transactions
          def transactions(options={})
            get("v1/reporting/transactions", options)
          end
        end
      end
    end
  end
end
