class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @country = "Signed in from #{@user.country}"
    @from = "I'm from #{@user.profile.born_country}"
  end

  def new
    @profile = current_user.build_profile
    @countries = ISO3166::Country.all_translated
    @country = current_user.country
  end

  def edit
    @profile = current_user.profile
    @countries = ISO3166::Country.all_translated
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      redirect_to profile_path(current_user)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:born_country, :name)
  end
end
