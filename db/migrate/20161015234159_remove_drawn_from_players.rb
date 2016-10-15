class RemoveDrawnFromPlayers < ActiveRecord::Migration[5.0]
  def change
    remove_column :players, :drawn, :integer, default: 0
  end
end
