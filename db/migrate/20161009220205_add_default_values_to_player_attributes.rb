class AddDefaultValuesToPlayerAttributes < ActiveRecord::Migration[5.0]
  def change
    change_column :players, :won, :integer, :default => 0
    change_column :players, :lost, :integer, :default => 0
    change_column :players, :drawn, :integer, :default => 0
    change_column :players, :winning_percentage, :decimal, :default => 0.00
  end
end
