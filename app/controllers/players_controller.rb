class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player =  Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html {redirect_to @player, notice: "#{@player.name} added!" }
        format.js   {}
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
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
