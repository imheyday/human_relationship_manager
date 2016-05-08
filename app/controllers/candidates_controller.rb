class CandidatesController < ApplicationController
  before_action :require_login

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

  def update
    find_candidate
    if @candidate.update_attributes(candidate_params)
      redirect_to candidate_path(@candidate)
    else
      render :edit
    end
  end

  def destroy
    find_candidate
    @candidate.destroy
    redirect_to candidates_path
  end

  private

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :email, :gender, :year_of_birth)
  end

  def find_candidate
    @candidate = Candidate.find(params[:id])
  end
end
