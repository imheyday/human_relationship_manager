class CandidatePresenter < BasePresenter
  def initialize(candidate)
    @candidate = candidate
    super
  end

  def full_name
    @candidate.full_name
  end
end
