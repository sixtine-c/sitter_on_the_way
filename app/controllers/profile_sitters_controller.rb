class ProfileSittersController < ApplicationController
  def new
    @profile_sitter = ProfileSitter.new
  end

  def index
    @profile_sitters = ProfileSitter.all
  end
end
