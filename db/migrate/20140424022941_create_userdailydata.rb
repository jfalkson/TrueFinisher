class CreateUserdailydata < ActiveRecord::Migration
  def change
    create_table :userdailydata do |t|
      #t.integer :user_id
      t.integer :calories_consumed
      t.integer :calories_exercised
      t.datetime :date
      t.integer :weight

      t.timestamps
    end
  end
end
