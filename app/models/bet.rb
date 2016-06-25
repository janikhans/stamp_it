class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :stamp
  has_many :payouts

  validates :stamp, :user, presence: true
  validates :wager, presence: true
end
