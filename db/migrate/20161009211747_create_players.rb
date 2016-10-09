class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :won
      t.integer :lost
      t.integer :drawn
      t.decimal :winning_percentage

      t.timestamps
    end
  end
end
