class Match < ApplicationRecord
  belongs_to :player1, class_name: "Player"
  belongs_to :player2, class_name: "Player"
  enum result: [:player1_wins, :player2_wins, :draw]
  validates_presence_of :player1
  validates_presence_of :player2
  validates_presence_of :result
  before_create :assign_result

  private

    def assign_result
      player_one = self.player1; player_two = self.player2
      begin
        Player.transaction do
          case self.result
          when "player1_wins"
            player_one.increment(:won, 1); player_one.save!
            player_two.increment(:lost, 1); player_two.save!
          when "player2_wins"
            player_one.increment(:lost, 1); player_one.save!
            player_two.increment(:won, 1); player_two.save!
          when "draw"
            player_one.increment(:drawn, 1); player_one.save!
            player_two.increment(:drawn, 1); player_two.save!
          else
            logger.error "Case statement in assign_result before_action"
            throw(:abort)
          end
        end
      rescue
        throw(:abort)
      end
    end
end
