require 'rails_helper'

RSpec.describe 'layouts/application.html.erb' do
  context 'signed_in? true' do
    it 'render user info' do
      user = build(:user)
      sign_in_as user
      render
      expect(rendered).to match user.email
    end
  end
end
