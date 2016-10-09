class Player < ApplicationRecord
  before_save :calculate_winning_percentage
  # TODO presence validations for name, win, lost, drawn, winning_percentage
  # TODO non-negative value validations for win, lost, drawn
  # TODO 0 <= p <= 1 validation for winning_percentage

  private

    # winning percentage calculated as ratio of wins to games played
    # drawn games are considered half a win
    def calculate_winning_percentage
      float_value = (self.won + (0.5*self.drawn))/(self.won + self.lost + self.drawn)
      self.winning_percentage = (float_value.nil? || float_value.nan?) ? 0 : float_value
    end
end
