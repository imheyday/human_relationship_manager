require 'rails_helper'

RSpec.describe PagesController do
  describe 'home' do
    it 'render home page' do
      get :home
      expect(response).to render_template :home
    end
  end
end
