class ProfileSittersController < ApplicationController

  SPECIES = ['dog', 'cat', 'snake', 'spider', 'parrot']
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index

    @profile_sitters = policy_scope(ProfileSitter.includes(:user))

    @markers = @profile_sitters.geocoded.map do |profile_sitter|
      {
        lat: profile_sitter.latitude,
        lng: profile_sitter.longitude,
        info_window: render_to_string(partial: "info_window", locals: { profile_sitter: profile_sitter })
      }
    end

    if params[:query].present?
      # sql_query = "profile_sitters.address ILIKE :query"
      test = params[:query]
      @profile_sitters = @profile_sitters.near(test, 10).geocoded
      @markers = @profile_sitters.geocoded.map do |profile_sitter|
      {
        lat: profile_sitter.latitude,
        lng: profile_sitter.longitude,
        info_window: render_to_string(partial: "info_window", locals: { profile_sitter: profile_sitter })
      }
      end
    else
      @profile_sitters = policy_scope(ProfileSitter)
    end
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
      redirect_to profile_sitters_path
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
