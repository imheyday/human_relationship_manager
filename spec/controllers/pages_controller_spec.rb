require 'rails_helper'

RSpec.describe PagesController do
  describe 'home' do
    context 'signed_in? true' do
      it 'render home page' do
        allow(controller).to receive(:signed_in?).and_return(true)
        get :home
        expect(response).to render_template :home
      end
    end
    context 'signed_in? false' do
      it 'redirect to sign_in' do
        allow(controller).to receive(:signed_in?).and_return(false)
        get :home
        expect(response).to redirect_to sign_in_url
      end
    end
  end
end
