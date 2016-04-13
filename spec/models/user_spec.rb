require 'rails_helper'

RSpec.describe User do
  describe '#create' do
    it 'be valid' do
      user = build(:user)
      expect(user.valid?).to eq true
    end
  end
end
