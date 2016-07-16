class JobApplicationsController < ApplicationController
  before_action :require_login

  def index
    @job_applications = JobApplication.all
  end

  def show
    find_job_application
  end

  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    if @job_application.save
      redirect_to job_application_path(@job_application)
    else
      render :new
    end
  end

  def edit
    find_job_application
  end

  def update
    find_job_application
    if @job_application.update_attributes(job_application_params)
      redirect_to job_application_path(@job_application)
    else
      render :edit
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(
      :received_at, :cv, :candidate_id, :contract_type_id, :job_type_id,
      contract_type_attributes: [:name],
      job_type_attributes: [:name],
      candidate_attributes: [:first_name, :last_name, :email, :gender, :year_of_birth]
    )
  end

  def find_job_application
    @job_application = JobApplication.find(params[:id])
  end
end
