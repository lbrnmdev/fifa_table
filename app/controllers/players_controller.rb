class PlayersController < ApplicationController
  def index
  end

  def new
    @player = Player.new
  end

  def show
  end

  def edit
  end

  private

    def player_params
      params.require(:player).permit(:name)
    end
end
