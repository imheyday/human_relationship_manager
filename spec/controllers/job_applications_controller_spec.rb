require 'rails_helper'

RSpec.describe JobApplicationsController do
  describe '#create' do
    it 'render show page' do
      allow(controller).to receive(:signed_in?).and_return(true)
      post :create, job_application: FactoryGirl.attributes_for(:job_application)
      expect(response).to redirect_to job_application_path(JobApplication.last.id)
    end
  end
  describe '#update' do
    it 'render edit page' do
      allow(controller).to receive(:signed_in?).and_return(true)
      job_application = FactoryGirl.create(:job_application)
      job_application.received_at = 1.day.ago
      post :update, id: job_application.id, job_application: job_application.attributes
      expect(response).to redirect_to job_application_path(job_application.id)
    end
  end
end
