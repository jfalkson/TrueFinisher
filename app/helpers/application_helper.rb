module ApplicationHelper

	def userBMR
    lastuserBMR=Profile.where(:user_id=>current_user.id).last.bmr
    return lastuserBMR
	end 

end
