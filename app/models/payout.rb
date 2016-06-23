class Payout < ApplicationRecord
  belongs_to :user
  belongs_to :stamp
  belongs_to :bet
end
