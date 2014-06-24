module ApplicationHelper

	def userBMR
    lastuserBMR=Profile.where(:user_id=>current_user.id).last.bmr
    return lastuserBMR
	end

	def goalCalories
	 goalWeight=Profile.where(:user_id=>current_user.id).last.goal_weight
	 startWeight=Profile.where(:user_id=>current_user.id).last.start_weight	
	 caloriesRequired = (startWeight - goalWeight) * 3500 
	 return caloriesRequired
	end

	##Find dates to include in current goal##
	def goalDates
	#gets all applicable dates	
	 goalstartdate=Profile.where(:user_id=>current_user.id).last.goalstartdate

	end


end
