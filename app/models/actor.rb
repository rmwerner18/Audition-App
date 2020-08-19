class Actor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    has_many :auditions
    has_many :events, through: :auditions
    has_many :casting_agents, through: :events
    has_many :submissions
end
