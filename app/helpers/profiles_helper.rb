module ProfilesHelper
 def profile_params
    params.require(:profile).permit(:full_name, :gender, :email, :age, :height, :weight, :activty_level)
  end

  def profile_params_id
    @profile = Profile.find(current_user.profile.id)
  end
end

