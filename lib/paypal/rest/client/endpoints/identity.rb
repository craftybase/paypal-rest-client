module Paypal
  module Rest
    class Client
      module Endpoints
        module Identity
          def userinfo
            get("v1/identity/oauth2/userinfo", { schema: 'paypalv1.1' })
          end
        end
      end
    end
  end
end
