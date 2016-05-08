require 'json'
client_secrets_hash = {
  web: {
    client_id: ENV['google_api_key'],
    client_secret: ENV['google_api_secret_key'],
    auth_uri: 'https://accounts.google.com/o/oauth2/auth',
    token_uri: 'https://accounts.google.com/o/oauth2/token'
  }
}
File.open('lib/assets/client_secrets.json', 'w') do |f|
  f.write(client_secrets_hash.to_json)
end
