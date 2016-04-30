require 'rails_helper'

RSpec.feature 'User clic to link menu' do
  scenario 'is redirect to job applications page' do
    user = create(:user)
    visit root_path(as: user)
    click_link(I18n.t('home.menu.job_applications'))
    expect(current_path).to eq job_applications_path
  end
end
