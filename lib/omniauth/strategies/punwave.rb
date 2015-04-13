require "omniauth/strategies/oauth2"
 
module OmniAuth
  module Strategies
    class Punwave < OmniAuth::Strategies::OAuth2
      option :name, :punwave
 
      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site:  "http://stage.member.punwave.com"
      }
 
      # Disable state-based CSRF protection
      option :provider_ignores_state, true
 
      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info["id"] }
 
      info do
        {
          :nickname => raw_info["nickname"],
          :email => raw_info["email"]
        }
      end
 
      extra do
        {
          "raw_info" => raw_info.reject { |k, v| ["nickname", "email"].include?(k) }
        }
      end
 
      def raw_info
        @raw_info ||= access_token.get("oauth/me.json").parsed
      end
    end
  end
end