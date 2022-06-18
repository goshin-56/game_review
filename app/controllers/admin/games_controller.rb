class Admin::GamesController < ApplicationController
  def index
    @game = Game.new
    @games = Game.all
  end

  def create
    @game = Game.new(game_params)
    @game.save
      redirect_to admin_games_path
  end

  private
  def game_params
    params.require(:game).permit(:image, :title, :player, :genre)
  end
end
