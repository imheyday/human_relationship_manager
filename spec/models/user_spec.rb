require 'rails_helper'

RSpec.describe User do
  describe '#create' do
    it 'be valid' do
      basic_user = build(:user)
      expect(basic_user.valid?).to eq true
    end
  end
end
