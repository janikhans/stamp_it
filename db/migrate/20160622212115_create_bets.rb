class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.references :ledger, foreign_key: true
      t.references :stamp, foreign_key: true
      t.boolean :outcome
      t.integer :wager

      t.timestamps
    end
  end
end
