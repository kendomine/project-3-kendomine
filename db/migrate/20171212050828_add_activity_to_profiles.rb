class AddActivityToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :activity, :decimal
  end
end
