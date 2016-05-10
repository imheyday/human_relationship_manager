require 'rails_helper'

RSpec.describe SessionsController do
  describe 'auth_with_google' do
    it 'render home page' do
      allow(controller).to receive(:signed_in?).and_return(true)
      get :auth_with_google
      expect(response).to redirect_to root_path
    end
  end
end
