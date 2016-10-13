class FixPlayerColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :matches, :winning_player, :winning_player_id
    rename_column :matches, :losing_player, :losing_player_id
  end
end
