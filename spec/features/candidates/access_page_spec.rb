require 'rails_helper'

RSpec.feature 'User clic to link menu' do
  scenario 'is redirect to candidates page' do
    user = create(:user)
    visit root_path(as: user)
    click_link(I18n.t('home.menu.candidates'))
    expect(current_path).to eq candidates_path
  end
end
