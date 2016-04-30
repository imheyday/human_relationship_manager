require 'rails_helper'

RSpec.describe 'candidates/index.html.erb' do
  it 'render candidates informations' do
    sign_in_as build(:user)
    candidates_count = 5
    assign(:candidates, create_list(:candidate, candidates_count))
    render
    expect(rendered).to have_content("#{I18n.t('home.menu.candidates')} (#{candidates_count})")
    expect(rendered).to have_selector('.candidatesList .candidatesList-item', count: candidates_count)
  end

  context 'with no candidates' do
    it 'render empty message' do
      sign_in_as build(:user)
      allow(@candidates).to receive('count').and_return(0)
      assign(:candidates, [])
      render
      expect(rendered).to have_content("#{I18n.t('candidate.messages.no_results')}")
    end
  end
end
