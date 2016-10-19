class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
  end

  private

    def player_params
      params.require(:player).permit(:name)
    end
end
