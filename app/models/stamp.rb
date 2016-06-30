class Stamp < ApplicationRecord

  scope :completed, -> { where "completed_at IS NOT NULL" }
  scope :ongoing, -> { where  completed_at: nil }
  scope :ending_first, -> { order(completion_date: :asc) }

  belongs_to :user
  has_many :bets
  has_many :payouts

  validates :user, :speaker, presence: true

  paginates_per 15

  def has_user_bet?(user)
    self.bets.where(user: user).any?
  end

  def completed?
    !completed_at.nil? && !outcome.nil?
  end

  def mark_complete!(outcome, user)
    if self.completed_at.nil?
      self.outcome = outcome
      self.completed_at = DateTime.now
      self.distribute_winnings
      self.save
    else
      return false
    end
  end

  def pot
    bets.map(&:wager).reduce(0, :+)
  end

  def percent_true
    upvote = bets.where(outcome: true).count
    downvote = bets.where(outcome: false).count
    total = upvote + downvote
    approval = upvote.to_f/total
    return approval.round(2)
  end

  def winners
    bets.where(outcome: self.outcome)
  end

  def winners_pool
    winners.map(&:wager).reduce(0, :+)
  end

  def distribute_winnings
    pot = self.pot
    bets = self.bets
    bets.each do |bet|
      payout = bet.payouts.build
      payout.user = bet.user
      payout.stamp = self
      if bet.outcome === self.outcome
        share = bet.wager/self.winners_pool.to_f
        payout.amount = share*pot
      else
        payout.amount = -bet.wager
      end
      payout.save
    end
  end

end
