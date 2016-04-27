require 'rails_helper'

RSpec.describe CandidatesController do
  describe '#create' do
    context 'good attributes' do
      it 'render show page' do
        allow(controller).to receive(:signed_in?).and_return(true)
        post :create, candidate: FactoryGirl.attributes_for(:candidate)
        expect(response).to redirect_to candidate_path(1)
      end
    end
  end
end
