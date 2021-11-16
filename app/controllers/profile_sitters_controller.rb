class ProfileSittersController < ApplicationController


  def index
    @profile_sitters = policy_scope(ProfileSitter.includes(:user))
  end
end
