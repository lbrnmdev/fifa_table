class Player < ApplicationRecord
  before_save :calculate_winning_percentage

  private

    # winning percentage calculated as ratio of wins to games played
    # drawn games are considered half a win
    def calculate_winning_percentage
      # won, lost, drawn, winning_percentage
      self.winning_percentage = (self.won + (0.5*self.drawn))/(self.won + self.lost + self.drawn)
    end
end
