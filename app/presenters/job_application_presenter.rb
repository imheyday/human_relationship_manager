class JobApplicationPresenter < BasePresenter
  def initialize(job_application)
    @job_application = job_application
  end

  def id
    @job_application.id
  end

  def received_at
    @job_application.received_at
  end

  def receive_date
    return I18n.t('no_date') if received_at.nil?
    I18n.l(received_at, format: :short_date)
  end

  def candidate
    @job_application.candidate
  end

  def candidate_name
    return I18n.t('job_application.messages.no_candidate') if candidate.nil?
    candidate.to_presenter.full_name
  end

  def candidate_link
    return I18n.t('job_application.messages.no_candidate') if candidate.nil?
    link_to candidate_name, candidate_path(candidate.id)
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

  def contract_name
    contract = @job_application.contract_type
    return I18n.t('job_application.messages.no_contract') if contract.nil?
    contract.name
  end
end
