class Userdailydatum < ActiveRecord::Base
belongs_to :user #, :foreign_key => 'user_id'
validates :calories_consumed, :calories_exercised, :weight, numericality: {greater_than_or_equal_to: 0.01}
validates :date, uniqueness: {scope: :user_id}, presence: true
end
