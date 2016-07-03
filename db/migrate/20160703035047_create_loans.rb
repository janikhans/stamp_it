class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.references :user, foreign_key: true
      t.references :ledger, foreign_key: true
      t.integer :amount
      t.string :type

      t.timestamps
    end
  end
end
