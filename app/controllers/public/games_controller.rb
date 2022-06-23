class Public::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(8)
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews.page(params[:page]).per(6)
  end

  private
  def game_params
    params.require(:game).permit(:image, :title, :player, :genre)
  end
end
