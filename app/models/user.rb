class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #making a call to devise importing the below modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :profiles
  has_many :userdailydata #:foreign_key => 'user_id'
  validates :email, :uniqueness=>true

  validates :user_gender, :user_name, :user_age, :presence=>true
  GENDER_TYPES = ["","Male", "Female"]


end
