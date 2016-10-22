class Match < ApplicationRecord
  belongs_to :winning_player, class_name: "Player"
  belongs_to :losing_player, class_name: "Player"
  validates_presence_of :winning_player
  validates_presence_of :losing_player
  validate :winner_and_loser_cannot_be_the_same
  before_create :assign_result
  before_destroy :reverse_result
  default_scope -> { order(created_at: :desc) }

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

    def winner_and_loser_cannot_be_the_same
      if(self.winning_player == self.losing_player)
        errors.add(:winning_player, "can't be the same as loser")
        errors.add(:losing_player, "can't be the same as winner")
      end
    end
end
