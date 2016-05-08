class JobApplicationsController < ApplicationController
  before_action :require_login

  def index
    @job_applications = JobApplication.all
  end

  private

  def candidate_params
    params.require(:job_application).permit(:received_at, :cv_file, :candidate_id)
  end

  def find_candidate
    @job_application = JobApplication.find(params[:id])
  end
end
