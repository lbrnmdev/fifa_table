class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :result
      t.references :player1, foreign_key: true
      t.references :player2, foreign_key: true

      t.timestamps
    end

    add_foreign_key :matches, :players, column: :player1_id
    add_foreign_key :matches, :players, column: :player2_id
  end
end
