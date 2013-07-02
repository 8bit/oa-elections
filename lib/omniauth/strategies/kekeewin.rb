module OmniAuth
  module Strategies
    class Kekeewin < OmniAuth::Strategies::OAuth2
      option :name, :kekeewin

      option :client_options, {
        site: ENV['KEKEEWIN_URL'],
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"].to_s
      end

      info do
        {email: raw_info["email"]}
      end

      def raw_info
        @raw_info ||= access_token.get('/api/me.json').parsed
      end
    end
  end
end