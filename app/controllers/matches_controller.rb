class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
