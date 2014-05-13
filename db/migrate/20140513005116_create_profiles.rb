class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :start_weight
      t.integer :goal_weight
      t.decimal :height

      t.timestamps
    end
  end
end
