module Paypal
  module Rest
    class Client
      module Endpoints
        module Products
          def products(options={})
            raise NotImplementedError
            # get("/v1/catalogs/products", options)
          end

          def product(id)
            raise NotImplementedError
            # get("v1/catalogs/products/#{id}")
          end
        end
      end
    end
  end
end
