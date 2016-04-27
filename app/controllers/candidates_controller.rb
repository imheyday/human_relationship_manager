class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
    find_candidate
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidate_path(@candidate)
    else
      render :new
    end
  end

  def edit
    find_candidate
  end

  private

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :email, :gender, :year_of_birth)
  end

  def find_candidate
    @candidate = Candidate.find(params[:id])
  end
end
