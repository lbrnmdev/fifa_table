class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :result
      t.references :player1, foreign_key: true
      t.references :player2, foreign_key: true

      t.timestamps
    end
  end
end
