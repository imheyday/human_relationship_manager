require 'rails_helper'

RSpec.describe 'job_applications/index.html.erb' do
  it 'render job_applications informations' do
    sign_in_as build(:user)
    job_applications_count = 5
    assign(:job_applications, create_list(:job_application, job_applications_count))
    render
    expect(rendered).to have_content("#{I18n.t('home.menu.job_applications')} (#{job_applications_count})")
    expect(rendered).to have_selector('.job_applicationsList .job_applicationsList-item', count: job_applications_count)
  end

  context 'with no job_applications' do
    it 'render empty message' do
      sign_in_as build(:user)
      allow(@job_applications).to receive('count').and_return(0)
      assign(:job_applications, [])
      render
      expect(rendered).to have_content("#{I18n.t('job_application.messages.no_results')}")
    end
  end
end
