class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def show
    #redirect_to profile_path(current_user) if current_user != params[:id]      
  end

end
