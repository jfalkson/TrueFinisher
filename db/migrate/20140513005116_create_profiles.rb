class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :start_weight
      t.integer :goal_weight
      t.decimal :height
      t.integer :user_id
      t.timestamps
    end
  end
end
