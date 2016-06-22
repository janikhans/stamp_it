class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.references :user, foreign_key: true
      t.references :stamp, foreign_key: true
      t.boolean :outcome
      t.integer :wager

      t.timestamps
    end
  end
end
