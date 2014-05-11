class UserdailydataController < ApplicationController
before_filter :authenticate_user! # :except => [:index, :show] 
helper_method :sort_column, :sort_direction
include ApplicationHelper

##Need to have this be the data of the specific user##
def index
 @userdailydata = Userdailydata.where(:user_id=>current_user.id)
 userdailycalories=@userdailydata.pluck(:calories_consumed)
 userdate=@userdailydata.pluck(:date)
 userdate.map! {|d| d.to_i}
 gon.userdate=userdate
 ##Need to format as {x: value}
#set graph data to x,y series of date, calories
 gon.calories_consumed=gon.userdate.zip(userdailycalories)
#gon.calories_consumed=userdailycalories

# clean_data = []
# userdailycalories.each_with_index do |value, index|
#   clean_data << {:x => index, :y => value}
# end 

# clean_data=clean_data.to_json

# gon.clean_data=raw(clean_data)

end

def new
@userdailydata=Userdailydata.new
end

def create
 @userdailydata=Userdailydata.new(allowed_params)
 @userdailydata.user_id = current_user.id
 @userdailydata.save
end

#only let this method be accessible within this specific class
private
def allowed_params
  params.require(:userdailydata).permit(:weight,:calories_consumed, :calories_exercised, :date, :user_id)
end



end