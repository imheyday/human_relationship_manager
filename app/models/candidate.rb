class Candidate < ActiveRecord::Base
  has_many :job_applications

  def to_presenter
    CandidatePresenter.new(self)
  end
end
