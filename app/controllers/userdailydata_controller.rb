class UserdailydataController < ApplicationController
before_filter :authenticate_user! # :except => [:index, :show] 
helper_method :sort_column, :sort_direction
include ApplicationHelper
respond_to :html, :json


##Need to have this be the data of the specific user##
def index
   @userdailydata = Userdailydatum.where(:user_id=>current_user.id)

    ##Historical caloric intake and calories burned
    userdailycalories=@userdailydata.pluck(:calories_consumed)
    userexercise=@userdailydata.pluck(:calories_exercised)
    userdate=@userdailydata.pluck(:date)
    userdate.map! {|d| d.to_i}
    
    ##Use gon gem for javascript rendering by client
    gon.userdate=userdate
    ## we put data in 2d array to be plotted
    gon.calories_consumed=gon.userdate.zip(userdailycalories)
    gon.calories_exercised=gon.userdate.zip(userexercise)
    calories_burned=userexercise
    ##Total calories burned in a given day
    calories_burned.map! {|calories| (calories+userBMR)}
    gon.calories_burned=gon.userdate.zip(calories_burned)


    ##Tracks calories burned since goal began 
    goal_calories_burned=@userdailydata.where("date > ?", goalDates).pluck(:calories_exercised)
    goal_date_ranges= @userdailydata.where("date > ?", goalDates).pluck(:date)
    goal_date_ranges.map! {|d| d.to_i}
    ##Running sum to track running sums when initially given an array
    goal_cumulative_caloriesburned = goal_calories_burned.inject([]) { |result, element| result << result.last.to_i + element }


    ##Need running sum
    percent_towards_goal = goal_cumulative_caloriesburned.map {|calories| (calories.to_f / goalCalories.to_f) }

    gon.percent_towards_goal=goal_date_ranges.zip(percent_towards_goal)


end

def edit
 @userdailydata = Userdailydatum.where(:user_id=>current_user.id)
end

def update
@userdailydata = Userdailydatum.find(params[:id])
#right now every row updates with the same
  respond_to do |format|
    if @userdailydata.update(allowed_params) 
       format.html { redirect_to @userdailydata }
       format.json { respond_with_bip(@userdailydata) }
   else
       format.html { render :action => "edit" }
       format.json { respond_with_bip(@userdailydata) }
   end
   end   

end


def show
@userdailydata = Userdailydatum.find(params[:id])
end

def new
@userdailydata=Userdailydatum.new
end

def create
 @userdailydata=Userdailydatum.new(allowed_params)
 @userdailydata.user_id = current_user.id
 @userdailydata.save
   # Tell the UserMailer to send an email after new data is added
Weeklystatus.weekly_email(current_user.email).deliver
end

#only let this method be accessible within this specific class
private
def allowed_params
  params.require(:userdailydatum).permit(:weight,:calories_consumed, :calories_exercised, :date, :user_id)
end



end