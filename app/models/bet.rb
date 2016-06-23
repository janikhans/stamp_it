class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :stamp
  has_many :payouts
end
