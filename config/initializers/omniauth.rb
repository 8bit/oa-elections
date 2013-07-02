require File.expand_path('lib/omniauth/strategies/kekeewin', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :kekeewin, ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE