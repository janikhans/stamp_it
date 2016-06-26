class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stamps
  has_many :bets
  has_many :payouts

  def worth
    payouts.map(&:amount).reduce(0, :+)
  end
end
