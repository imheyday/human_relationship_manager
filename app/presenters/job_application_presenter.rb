class JobApplicationPresenter
  def initialize(job_application)
    @job_application = job_application
  end

  def id
    @job_application.id
  end

  def received_at
    @job_application.received_at
  end

  def cv_file
    @job_application.cv_file
  end

  def created_at
    @job_application.created_at
  end

  def updated_at
    @job_application.updated_at
  end
end
