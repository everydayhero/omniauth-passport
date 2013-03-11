require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Passport < OmniAuth::Strategies::OAuth2
      PARAMS = %w[name email phone background_colour tagline header_image background_image]

      option :name, 'passport'
      option :client_options, {:site => 'https://passport.everydayhero.com'}

      uid { raw_info['id'] }

      info do
        {
          :email => raw_info['email'],
          :name  => raw_info['name'],
          :birthday => raw_info['birthday']
        }
      end

      def request_phase
        params = request.params.slice *PARAMS
        options.authorize_params.update params

        super
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
