require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Passport < OmniAuth::Strategies::OAuth2
      option :name, 'passport'
      option :client_options, {:site => 'http://passport.edh.dev'}

      uid { raw_info['id'] }

      info do
        {
          :email => raw_info['email'],
          :name  => raw_info['name']
        }
      end

      def raw_info
        # @raw_info ||= access_token.get('/api/v1/me.json').parsed
        {'email' => 'coop@latrobest.com', 'name' => 'Tim Cooper', 'id' => 1}
      end
    end
  end
end
