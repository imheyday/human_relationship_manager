require 'rails_helper'

RSpec.describe 'candidates/index.html.erb' do
  it 'render candidates informations' do
    sign_in_as build(:user)
    candidates_count = 5
    allow(@candidates).to receive('count').and_return(candidates_count)
    render
    expect(rendered).to have_css('.page-heading', "#{I18n.t('home.menu.candidates')} (#{candidates_count})")
  end
end
