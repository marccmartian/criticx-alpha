class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @platforms = @game.platforms
    @genres = @game.genre
  end
end
