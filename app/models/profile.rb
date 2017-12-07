class Profile < ApplicationRecord
 belongs_to :user
  validates :full_name, :gender, :age, :weight, :height, :activty_level, :email,  presence:true
  validates_email_format_of :email, :message => 'Please enter a correct email'
  validates :email, uniqueness: {case_sensitive:false}
end