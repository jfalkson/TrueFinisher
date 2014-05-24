class Profile < ActiveRecord::Base
	belongs_to :user
	validates :start_weight, :goal_weight, :height, :presence=>true
	validates :start_weight, :goal_weight, :height, numericality: {greater_than_or_equal_to: 0.01}

end
