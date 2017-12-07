class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :email
      t.string :gender
      t.integer :age
      t.integer :weight
      t.decimal :height
      t.string :activty_level
      t.integer :goal
      t.string :length
      t.integer :deadlift
      t.integer :squat
      t.integer :overhead_press
      t.integer :bench_press
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
