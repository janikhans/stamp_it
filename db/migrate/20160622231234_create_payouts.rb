class CreatePayouts < ActiveRecord::Migration[5.0]
  def change
    create_table :payouts do |t|
      t.references :user, foreign_key: true
      t.references :stamp, foreign_key: true
      t.references :bet, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
