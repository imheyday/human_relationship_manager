require 'rails_helper'

RSpec.describe UserAuthentication do
  describe '#new' do
    it 'initialize auth information' do
      oauth_object = double(:oauth, access_token: '1234AZERTY', refresh_token: 'REFRESH1234')
      user_authentication = UserAuthentication.new(oauth_object)
      expect(user_authentication.access_token).to eq oauth_object.access_token
      expect(user_authentication.refresh_token).to eq oauth_object.refresh_token
    end
  end
  describe '#auth!' do
    it 'authenticate user with token' do
      userinfo = File.read 'spec/support/responses/google_userinfo.json'
      stub_request(:get, 'https://www.googleapis.com/oauth2/v1/userinfo?access_token=1234AZERTY&alt=json').with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      ).to_return(
        status: 200, body: userinfo, headers: {}
      )
      oauth_object = double(:oauth, access_token: '1234AZERTY', refresh_token: 'REFRESH1234')
      user_authentication = UserAuthentication.new(oauth_object)
      user_authentication.auth!
      expect(Authentication.first.token).to eq oauth_object.access_token
    end
  end
end
