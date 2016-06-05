require 'rails_helper'

RSpec.describe CandidatesController do
  describe '#create' do
    it 'render show page' do
      allow(controller).to receive(:signed_in?).and_return(true)
      post :create, candidate: FactoryGirl.attributes_for(:candidate)
      expect(response).to redirect_to candidate_path(Candidate.last.id)
    end
  end
  describe '#update' do
    it 'render edit page' do
      allow(controller).to receive(:signed_in?).and_return(true)
      candidate = FactoryGirl.create(:candidate)
      candidate.first_name = 'toto'
      post :update, id: candidate.id, candidate: candidate.attributes
      expect(response).to redirect_to candidate_path(candidate.id)
    end
  end
end
