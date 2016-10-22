class Player < ApplicationRecord
  before_save :calculate_winning_percentage
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :won, numericality: { greater_than_or_equal_to: 0 }
  validates :lost, numericality: { greater_than_or_equal_to: 0 }
  validates :winning_percentage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  default_scope -> { order(winning_percentage: :desc) }

  # Keep this to be used in building forms maybe?
  has_many :won_matches, class_name: "Match", foreign_key: :winning_player_id, dependent: :destroy
  has_many :lost_matches, class_name: "Match", foreign_key: :losing_player_id, dependent: :destroy

  # return all the player's matches
  def matches
    Match.where("winning_player_id = ? OR losing_player_id = ?", self.id, self.id).order(created_at: :desc)
  end

  def matches_won_against opponent
    Match.where("winning_player_id = ? AND losing_player_id = ?", self.id, opponent.id)
  end

  def matches_lost_to opponent
    Match.where("losing_player_id = ? AND winning_player_id = ?", self.id, opponent.id)
  end

  private

    # winning percentage calculated as ratio of wins to games played
    def calculate_winning_percentage
      games_played = self.won + self.lost
      if games_played == 0
        self.winning_percentage = 0.0
      else
        self.winning_percentage = (self.won*1.0)/games_played
      end
    end
end
