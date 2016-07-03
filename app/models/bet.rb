class Bet < ApplicationRecord
  belongs_to :ledger, inverse_of: :bets
  belongs_to :stamp
  has_many :payouts

  validates :stamp, :ledger, presence: true
  validates :wager,
    presence: true,
    numericality: { greater_than: 0 }
  validates :stamp_id, uniqueness: { scope: :ledger_id, message: "You've already bet on this stamp!" }
  validates_numericality_of :wager, greater_than: Proc.new { |r| r.wager_was }, on: :update

end
