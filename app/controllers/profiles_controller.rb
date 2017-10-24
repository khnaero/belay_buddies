class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :set_user
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = current_user.build_profile
  end

  def edit
  end

  def create
    @profile = current_user.create_profile(profile_params)
    @profile.user_id = @user_id

    respond_to do |format|
      if @profile.save
        redirect_to @profile, notice: 'Profile was successfully created.' 
      end
    end
  end

  def update
    # respond_to do |format|
      if @profile.update(profile_params)
        redirect_to user_profile_path(@profile)
      #   format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @profile }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    # end
  end

  # def destroy
  #   @profile.destroy
  #   respond_to do |format|
  #     format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def set_profile
      #@profile = current_user.profile || current_user.build_profile
      #@profile = Profile.find_by(user_id: params[:id])
      #@profile = Profile.find(params[:id])
      #@profile = current_user.profile.find(params[:id])
      #@profile = Profile.find_by user_id: current_user.id
      @profile = current_user.profile
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def profile_params
      params.require(:profile).permit(:acceptance, :city, :state_province, :country, :description, :aid, :trad, :bouldering, :sport)
    end
end
