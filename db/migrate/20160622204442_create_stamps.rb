class CreateStamps < ActiveRecord::Migration[5.0]
  def change
    create_table :stamps do |t|
      t.references :user, foreign_key: true
      t.string :speaker
      t.datetime :spoken_date
      t.datetime :completion_date
      t.boolean :outcome
      t.string :proof
      t.text :quote
      t.datetime :completed_at

      t.timestamps
    end
  end
end
