class Entry < ApplicationRecord
belongs_to :user
validates :date, :caloricGoal, :actualCalories, presence:true
end
