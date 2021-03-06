class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #attr_accessor :name

  validates :name, presence: true
  validates :name, uniqueness: true, if: -> { self.name.present? }
  has_many :events
end
