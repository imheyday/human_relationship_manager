class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :email, :gender, :year_of_birth)
  end
end
