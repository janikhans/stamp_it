class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :stamp
  has_many :payouts

  validates :stamp, :user, presence: true
  validates :wager,
    presence: true,
    numericality: { greater_than: 0 }
  validates :stamp_id, uniqueness: { scope: :user_id, message: "You've already bet on this stamp!" }
  validates_numericality_of :wager, greater_than: Proc.new { |r| r.wager_was }, on: :update

  def test
    puts "TEST!!!!"
  end


end
