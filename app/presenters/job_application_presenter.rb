class JobApplicationPresenter < BasePresenter
  def initialize(job_application)
    @job_application = job_application
    super
  end

  def cv_url(format = nil)
    @job_application.cv.url(format)
  end

  def received_default_date
    return nil if received_at.nil?
    I18n.l(received_at, format: :short)
  end

  def received_picker_date
    return nil if received_at.nil?
    I18n.l(received_at, format: :datepicker)
  end

  def received_date
    return I18n.t('no_date') if received_default_date.nil?
    received_default_date
  end

  def candidate_name
    return I18n.t('job_application.messages.no_candidate') if candidate.nil?
    candidate.to_presenter.full_name
  end

  def candidate_age
    return I18n.t('job_application.messages.no_candidate_age') if candidate.nil?
    "#{candidate.to_presenter.age} #{I18n.t('years_old')}"
  end

  def candidate_gender
    return I18n.t('job_application.messages.no_candidate_age') if candidate.nil?
    I18n.t(candidate.to_presenter.gender).capitalize
  end

  def candidate_link
    return I18n.t('job_application.messages.no_candidate') if candidate.nil?
    link_to candidate_name, candidate_path(candidate.id)
  end

  def candidate_email
    return I18n.t('job_application.messages.no_candidate_email') if candidate.nil?
    candidate.email
  end

  def contract_name
    return I18n.t('job_application.messages.no_contract') if contract_type.nil?
    contract_type.name
  end

  def job_name
    return I18n.t('job_application.messages.no_job') if job_type.nil?
    job_type.name
  end

  def cv
    @job_application.cv
  end
end
