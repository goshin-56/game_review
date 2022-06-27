class Admin::GamesController < ApplicationController
  def index
    @game = Game.new
    @games = Game.page(params[:page]).per(7)
  end

  def create
    @game = Game.new(game_params)
    @game.save
      redirect_to admin_games_path
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.new(game_params)
    @game.save
      redirect_to admin_game_path(@game.id)
  end

  private
  def game_params
    params.require(:game).permit(:image, :title, :player, :genre)
  end
end
