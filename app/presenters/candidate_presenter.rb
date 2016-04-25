class CandidatePresenter
  def initialize(candidate)
    @candidate = candidate
  end

  def id
    @candidate.id
  end

  def full_name
    "#{@candidate.last_name.upcase} #{@candidate.first_name}"
  end

  def created_at
    @candidate.created_at
  end

  def updated_at
    @candidate.updated_at
  end
end
