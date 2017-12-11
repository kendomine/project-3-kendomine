class ProfilesController < ApplicationController
  before_action :profile_params_id, only: [:update, :edit, :destroy]
  before_action :authentication


  def index
    if current_user.profile
      @profile = current_user.profile
    else
      redirect_to new_profile_path
    end
  end

  def new
    if current_user.profile
      redirect_to my_profile_path
    end
  end

  def edit
    
  end

  def create
    @profile = Profile.new(profile_params)
    if current_user.profile = @profile
      flash[:success] = "You have created your profile"
      redirect_to my_profile_path
    else
      flash[:error] = @profile.errors.full_messages[0]
      redirect_to new_profile_path
    end
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = "Successfully updated profile!"
      redirect_to my_profile_path
    else
      flash[:error] = @profile.errors.full_messages[0]
      redirect_to profile_path
    end
  end
end
