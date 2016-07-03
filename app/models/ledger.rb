class Ledger < ApplicationRecord
  belongs_to :user, inverse_of: :ledger
  has_many :bets, inverse_of: :ledger
  has_many :payouts
end
