class CandidatePresenter
  def initialize(candidate)
    @candidate = candidate
  end

  def id
    @candidate.id
  end

  def full_name
    "#{@candidate.first_name.capitalize} #{@candidate.last_name.upcase}"
  end

  def email
    @candidate.email
  end

  def gender
    @candidate.gender
  end

  def year_of_birth
    @candidate.year_of_birth
  end

  def created_at
    @candidate.created_at
  end

  def updated_at
    @candidate.updated_at
  end
end
