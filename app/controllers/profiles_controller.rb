class ProfilesController < ApplicationController
  before_action :profile_params_id, only: [:update, :edit, :destroy]
  before_action :authentication


  def index
    if current_user.profile
      @profile = current_user.profile
      if @profile.gender == "male"
        @tdee = (10 * (@profile.weight * 0.45359237)) + (6.25 * ((@profile.height * 12) * 2.54)) - (5 * @profile.age + 5) * @profile.activty_level.to_i
      else



        @tdee = 10 * (@profile.weight * 0.45359237) + 6.25 * ((@profile.height * 12) * 2.54) - 5 * @profile.age - 165 * @profile.activty_level.to_i
      end
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


