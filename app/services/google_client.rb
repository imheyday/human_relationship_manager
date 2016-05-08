require 'google/apis/gmail_v1'
require 'google/api_client/client_secrets'

class GoogleClient
  attr_reader :client, :code

  def initialize(code: nil)
    @client = auth_client
    @code = code
  end

  def auth_client
    client_secrets = Google::APIClient::ClientSecrets.load('lib/assets/client_secrets.json')
    client = client_secrets.to_authorization
    client.update!(
      scope: [
        'https://mail.google.com/',
        'https://www.googleapis.com/auth/userinfo.email',
        'https://www.googleapis.com/auth/userinfo.profile'
      ],
      redirect_uri: url_callback
    )
  end

  def auth_url
    @client.authorization_uri.to_s
  end

  def fetch_access_token
    @client.code = @code
    @client.fetch_access_token!
    @client.client_secret = nil
    @client
  end

  private

  def url_callback
    "http://#{ENV['host']}/auth/google/callback"
  end
end
