require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class Punwave < OmniAuth::Strategies::OAuth2
      option :name, :punwave

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site:  "https://members@panmedia.asia",
        response_type: :code,
        token_url: "oauth/access_token"
      }

      # Disable state-based CSRF protection
      option :provider_ignores_state, true

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info["user"]["id"] }

      info do
        raw_info["user"]
      end

      extra do
        hash = {}
        hash['raw_info'] = raw_info unless skip_info?
        prune! hash
      end

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end

      def raw_info
        @raw_info ||= access_token.get("api/v1/profile").parsed
      end
    end
  end
end
