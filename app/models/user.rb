class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.current
    Thread.current[:current_user]
  end

  def self.current=(usr)
    Thread.current[:current_user] = usr
  end
end
