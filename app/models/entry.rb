class Entry < ApplicationRecord
belongs_to :user
validates :date, :caloricgoal, :actualCalories, presence:true
end
