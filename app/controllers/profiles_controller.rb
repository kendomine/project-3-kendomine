class ProfilesController < ApplicationController
  before_action :profile_params_id, only: [:update, :edit, :destroy]
  before_action :authentication


  def index
    if current_user.profile
      @profile = current_user.profile
      @height= @profile.height * 30.48 * 6.25
      @weight = @profile.weight * 0.45359237
      @age = 5 * @profile.age + 5
      @fage = 5 * @profile.age - 165
      @bmr = 10 * @weight + @height - @age 
      @fbmr = 10 * @weight + @height -@fage
      @bulk = @bmr * @profile.activity + 500
      @cut = @bmr * @profile.activity - 500




      if @profile.gender == "Male"
        @tdee = @bmr * @profile.activity
     
      else

        @tdee = @fbmr * @profile.activity
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


