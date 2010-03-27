class User < ActiveRecord::Base
  devise :authenticatable,  :recoverable, :rememberable, :trackable, :validatable, :registerable #,:confirmable
  attr_accessible :email, :password, :password_confirmation
end
