class Match < ApplicationRecord
  belongs_to :winning_player, class_name: "Player"
  belongs_to :losing_player, class_name: "Player"
  validates_presence_of :winning_player
  validates_presence_of :losing_player
  before_create :assign_result

  private

    def assign_result
      winner = self.winning_player; loser = self.losing_player
      Player.transaction do
        self.winning_player.increment(:won, 1); winner.save!
        self.losing_player.increment(:lost, 1); loser.save!
      end
    end
end
