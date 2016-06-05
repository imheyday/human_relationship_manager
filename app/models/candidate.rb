class Candidate < ActiveRecord::Base
  has_many :job_applications

  def to_presenter
    CandidatePresenter.new(self)
  end

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}".strip
  end
end
