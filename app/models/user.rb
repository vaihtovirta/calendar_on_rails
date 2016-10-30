class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true
  validates_email_format_of :email

  has_many :events, dependent: :destroy
end
