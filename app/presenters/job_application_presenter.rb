class JobApplicationPresenter < BasePresenter
  def initialize(job_application)
    @job_application = job_application
    super
  end

  def receive_date
    return I18n.t('no_date') if received_at.nil?
    I18n.l(received_at, format: :short_date)
  end

  def candidate_name
    return I18n.t('job_application.messages.no_candidate') if candidate.nil?
    candidate.to_presenter.full_name
  end

  def candidate_link
    return I18n.t('job_application.messages.no_candidate') if candidate.nil?
    link_to candidate_name, candidate_path(candidate.id)
  end

  def contract_name
    contract = @job_application.contract_type
    return I18n.t('job_application.messages.no_contract') if contract.nil?
    contract.name
  end
end
