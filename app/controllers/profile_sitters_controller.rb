class ProfileSittersController < ApplicationController

  SPECIES = ['dog', 'cat', 'snake', 'spider', 'parrot']
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @profile_sitters = policy_scope(ProfileSitter.includes(:user))
  end

  def new
    @profile_sitter = ProfileSitter.new
    @user = current_user
    authorize @profile_sitter
  end

  def show
    @profile_sitter = ProfileSitter.find(params[:id])
    authorize @profile_sitter
  end

  def create
    @profile_sitter = ProfileSitter.new(profile_sitter_params)
    @profile_sitter.user = current_user
    authorize @profile_sitter
    if @profile_sitter.save
      redirect_to profile_sitter_path(@profile_sitter)
    else
      render:new
    end
  end

  def destroy
    @profile_sitter = ProfileSitter.find(params[:id])
    @profile_sitter.destroy
    redirect_to profile_sitter_path
  end

  private

  def profile_sitter_params
    params.require(:profile_sitter).permit(:description, :address, :start_date, :end_date, :user_id)
  end
end
