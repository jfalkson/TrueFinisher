class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]
  include ApplicationHelper
  # GET /profiles
  # GET /profiles.json
  def index
    @profile = Profile.where(:user_id=>current_user.id)
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
   @profile=Profile.where(:user_id=>current_user.id).last
#need to create bmr column 
   gon.bmr=@profile.bmr
   gon.bmr=@profile.bmr
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.where(:user_id=>current_user.id).last
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
  if current_user.user_gender="Male" then
#need to create bmr column 
   @profile.bmr=(66+(6.23*@profile.start_weight) + (12.7*@profile.height) - (6.8 * current_user.user_age.to_i)).round(2)
  else
   @profle.bmr=(655+(4.35*@profile.start_weight) + (4.7*@profile.height) - (4.7 * current_user.user_age.to_i)).round(2)
  end
    @profile.save


    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update

    @profile=Profile.where(:user_id=>current_user.id).last
 if current_user.user_gender="Male" then
#need to create bmr column 
   @profile.bmr=(66+(6.23*@profile.start_weight) + (12.7*@profile.height) - (6.8 * current_user.user_age.to_i)).round(2)
  else
   @profle.bmr=(655+(4.35*@profile.start_weight) + (4.7*@profile.height) - (4.7 * current_user.user_age.to_i)).round(2)
  end


    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
    @profile.save
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.where(:user_id=>current_user.id).last
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.where(:user_id=>current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:start_weight, :goal_weight, :height, :user_id, :goalstartdate)
    end
end
