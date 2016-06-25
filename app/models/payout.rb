class Payout < ApplicationRecord
  belongs_to :user
  belongs_to :stamp
  belongs_to :bet

  validates :user,
    :stamp,
    :bet,
    :amount,
    presence: true
    
end
