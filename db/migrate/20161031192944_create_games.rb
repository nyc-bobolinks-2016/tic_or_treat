class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :user, index: true, null: false
      t.string :board, null: false
      t.integer :outcome, null: false #can be -1 0 and 1 for lose draw and win

      t.timestamps(null: false)
    end
  end
end
