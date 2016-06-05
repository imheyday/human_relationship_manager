class JobApplication < ActiveRecord::Base
  belongs_to :candidate
  accepts_nested_attributes_for :candidate, reject_if: :all_blank
  belongs_to :contract_type
  accepts_nested_attributes_for :contract_type, reject_if: :all_blank
  belongs_to :job_type
  accepts_nested_attributes_for :job_type, reject_if: :all_blank

  def to_presenter
    JobApplicationPresenter.new(self)
  end
end
