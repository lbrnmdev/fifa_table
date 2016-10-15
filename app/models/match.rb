class Match < ApplicationRecord
  belongs_to :winning_player, class_name: "Player"
  belongs_to :losing_player, class_name: "Player"
  validates_presence_of :winning_player
  validates_presence_of :losing_player
  before_create :assign_result
  before_destroy :reverse_result

  private

    def assign_result
      winner = self.winning_player; loser = self.losing_player
      Player.transaction do
        winner.increment(:won, 1); winner.save!
        loser.increment(:lost, 1); loser.save!
      end
    end

    def reverse_result
      winner = self.winning_player; loser = self.losing_player
      Player.transaction do
        winner.decrement(:won, 1); winner.save!
        loser.decrement(:lost, 1); loser.save!
      end
    end
end
