class Player < ApplicationRecord
  before_save :calculate_winning_percentage
  validates :name, presence: true
  validates :won, numericality: { greater_than_or_equal_to: 0 }
  validates :lost, numericality: { greater_than_or_equal_to: 0 }
  validates :drawn, numericality: { greater_than_or_equal_to: 0 }
  validates :winning_percentage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  # return all the player's matches
  def matches
    Match.where("player1_id = ? OR player2_id = ?", self.id, self.id)
  end

  private

    # winning percentage calculated as ratio of wins to games played
    # drawn games are considered half a win
    def calculate_winning_percentage
      games_played = self.won + self.lost + self.drawn
      if games_played == 0
        self.winning_percentage = 0.0
      else
        self.winning_percentage = (self.won + (0.5*self.drawn))/games_played
      end
    end
end
