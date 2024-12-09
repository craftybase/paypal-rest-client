module Paypal
  module Rest
    class Client
      module Endpoints
        module Invoices
          def invoices(options={})
            post("v1/invoicing/search", options)
          end

          def invoice(id)
            get("v2/invoicing/invoices/#{id}")
          end
        end
      end
    end
  end
end
