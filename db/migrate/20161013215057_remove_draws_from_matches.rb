class RemoveDrawsFromMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :result, :integer
    rename_column :matches, :player1_id, :winning_player
    rename_column :matches, :player2_id, :losing_player
  end
end
