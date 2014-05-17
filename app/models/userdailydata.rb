class Userdailydata < ActiveRecord::Base
belongs_to :user #:foreign_key => 'user_id'
validates :calories_consumed, numericality: { only_integer: true }
	
end
