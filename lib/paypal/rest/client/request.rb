module Paypal
  module Rest
    class Client
      module Request
        def get(path, params={}); request(:get, path, params); end
        def post(path, params={}); request(:post, path, params); end
        def put(path, params={}); request(:put, path, params); end
        def delete(path, params={}); request(:delete, path, params); end

        private

        def request(method, path, params={})
          response = make_request(method, path, params)
          handle_response(response)
        end

        def make_request(method, path, params)
          headers = {
            'Accept'                  => 'application/json',
            'Content-Type'            => 'application/json',
            'X-PAYPAL-REQUEST-SOURCE' => 'MPA-DEVICE'
          }

          if @token
            headers['Authorization'] = "Bearer #{@token}"
          end

          endpoint(api_base).send(method, path, params) do |request|
            request.headers = headers
          end
        end

        def endpoint(url)
          connection = Faraday.new(url) do |conn|
            conn.request :json
            conn.use(Faraday::Request::UrlEncoded)
            conn.use(Faraday::Response::Logger) if Rails.logger.level <= Logger::INFO
            conn.adapter(Faraday.default_adapter)
          end
        end

        def handle_response(response)
          json = JSON.parse(response.body)

          if response.success?
            format_response(json)
          else
            handle_response_error(response, json)
          end
        end

        def format_response(data)
          case data
            when Array
              data.map { |obj| Hashie::Mash.new(obj) }
            else
              Hashie::Mash.new(data)
          end
        end

        def handle_response_error(response, json)
          case response.status
            when 400
              raise InvalidRequestError, json["message"]
            when 401
              raise AuthError, json["message"]
            when 403
              raise InvalidToken, json["message"]
            when 404
              raise NotFoundError, json["message"]
            when 429
              raise TooManyRequestsError, json["message"]
            else
              raise Error, json["message"]
          end
        end

        def api_base
          @api_base ||= @sandbox ? "https://api.sandbox.paypal.com" : "https://api.paypal.com"
        end
      end
    end
  end
end
