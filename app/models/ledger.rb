class Ledger < ApplicationRecord
  belongs_to :user, inverse_of: :ledger
  has_many :bets, inverse_of: :ledger
  has_many :payouts
  has_many :user_loans
  has_many :computer_loans
  has_many :loans

  has_many :stamps, through: :user

  after_create :receive_initial_loan

  def available
    loans = self.loans.map(&:amount).reduce(0, :+)
    payouts = self.payouts.map(&:amount).reduce(0, :+)
    outstanding_bets = self.outstanding_bets
    return available = loans + payouts - outstanding_bets
  end

  def outstanding_bets
    bets.where(completed: false).map(&:wager).reduce(0, :+)
  end

  private

    def receive_initial_loan
      ComputerLoan.create(ledger: self, amount: 1000)
    end
end
