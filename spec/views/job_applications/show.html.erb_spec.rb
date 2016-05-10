require 'rails_helper'

RSpec.describe 'job_applications/show.html.erb' do
  it 'render job applications informations' do
    sign_in_as build(:user)
    job_application = create(:job_application)
    assign(:job_application, job_application)
    render
    expect(rendered).to have_content(job_application.received_at)
  end
end
