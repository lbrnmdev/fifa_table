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
    @player = Player.find(params[:id])
  end

  # TODO Implement JS where form collapses beneath player card
  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      flash[:success] = "player info updated!"
      redirect_to @player
    else
      render action: "edit"
    end
  end

  def destroy
    Player.find(params[:id]).destroy!
    flash[:success] = "player deleted!"
    redirect_to players_url
  end

  private

    def player_params
      params.require(:player).permit(:name)
    end
end
