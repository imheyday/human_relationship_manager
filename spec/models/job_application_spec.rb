require 'rails_helper'

RSpec.describe JobApplication do
  describe '#create' do
    it 'be valid' do
      job_application = build(:job_application)
      expect(job_application.valid?).to eq true
    end
  end
end
