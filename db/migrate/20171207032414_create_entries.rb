class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :date
      t.string :weighIn
      t.string :caloricGoal
      t.string :fatGoal
      t.string :carbGoal
      t.string :proteinGoal
      t.string :actualCalories
      t.string :actualFat
      t.string :actualCarb
      t.string :actualProtein
      t.string :progress
      t.string :day
      t.belongs_to :user, foreign_key: true


      t.timestamps
    end
  end
end
