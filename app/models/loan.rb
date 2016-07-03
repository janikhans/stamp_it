class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :ledger

  validates :ledger, presence: true
  validates :amount,
    presence: true,
    numericality: { greater_than: 0 }
end
