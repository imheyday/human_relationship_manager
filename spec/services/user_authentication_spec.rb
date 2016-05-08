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
      oauth_object = double(:oauth, access_token: '1234AZERTY', refresh_token: 'REFRESH1234')
      user_authentication = UserAuthentication.new(oauth_object)
      user_authentication.auth!
      expect(Authentication.first.token).to eq oauth_object.access_token
    end
  end
end
