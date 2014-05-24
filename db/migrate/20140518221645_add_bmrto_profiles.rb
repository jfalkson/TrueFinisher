class AddBmrtoProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :bmr, :integer
  end
end
