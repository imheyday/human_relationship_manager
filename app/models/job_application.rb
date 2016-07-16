class JobApplication < ActiveRecord::Base
  include Paperclipable

  belongs_to :candidate
  accepts_nested_attributes_for :candidate, reject_if: :all_blank
  belongs_to :contract_type
  accepts_nested_attributes_for :contract_type, reject_if: :all_blank
  belongs_to :job_type
  accepts_nested_attributes_for :job_type, reject_if: :all_blank

  has_attached_file :cv
  validates_attachment_content_type :cv, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']

  def file_upload_content_type
    cv_content_type
  end

  def to_presenter
    JobApplicationPresenter.new(self)
  end
end
