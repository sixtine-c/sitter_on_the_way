class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :home

  def home
    @profile_sitters = ProfileSitter.all
  end
end
