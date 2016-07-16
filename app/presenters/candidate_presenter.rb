class CandidatePresenter < BasePresenter
  def initialize(candidate)
    @candidate = candidate
    super
  end

  def full_name
    @candidate.full_name
  end

  def age
    return I18n.t('candidate.messages.no_age') if @candidate.year_of_birth.nil?
    @candidate.age
  end

  def gender
    return I18n.t('candidate.messages.no_gender') if @candidate.gender.nil?
    @candidate.gender
  end
end
