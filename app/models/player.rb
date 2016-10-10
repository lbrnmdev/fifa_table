class Player < ApplicationRecord
  before_save :calculate_winning_percentage
  # TODO presence validations for name, win, lost, drawn, winning_percentage
  # TODO non-negative value validations for win, lost, drawn
  # TODO 0 <= p <= 1 validation for winning_percentage

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
