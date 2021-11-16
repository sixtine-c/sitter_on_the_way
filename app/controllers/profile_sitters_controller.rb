class ProfileSittersController < ApplicationController


  def index
    @profile_sitters = policy_scope(ProfileSitter)
    @users = User.all
  end
end
