class AddGoalstartdateToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :goalstartdate, :date
  end
end
