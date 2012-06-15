require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Passport < OmniAuth::Strategies::OAuth2
      option :name, 'passport'
      option :client_options, {:site => 'http://114.141.198.124:3000'}

      uid { raw_info['id'] }

      info do
        {
          :email => raw_info['email'],
          :name  => raw_info['name']
        }
      end

      def raw_info
        @raw_info ||= begin
          parsed = access_token.get('/api/v1/me').parsed
          parsed.fetch 'user', Hash.new
        end
      end
    end
  end
end
