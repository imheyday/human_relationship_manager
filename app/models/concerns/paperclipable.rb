module Paperclipable
  extend ActiveSupport::Concern

  include do
    before_post_process :skip_for_pdf
  end

  def skip_for_pdf
    ! %w(application/pdf).include?(file_upload_content_type)
  end
end
