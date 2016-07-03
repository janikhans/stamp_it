class Payout < ApplicationRecord
  belongs_to :ledger, inverse_of: :payouts
  belongs_to :stamp
  belongs_to :bet

  validates :ledger,
    :stamp,
    :bet,
    :amount,
    presence: true

end
