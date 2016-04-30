require 'rails_helper'

RSpec.describe 'candidates/edit.html.erb' do
  it 'render candidates informations' do
    sign_in_as build(:user)
    assign(:candidate, create(:candidate))
    render
    expect(rendered).to have_content('François BLANCHARD')
  end
end
