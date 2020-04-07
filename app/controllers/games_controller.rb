class GamesController < ApplicationController
  def new
  end
  def create
  end
  def index
  end
  def show
  end
  def update
  end
  def destroy
  end
  private
  def game_params#アクション名、メソッド
    params.require(:game).permit( :title, :image, :feeling)
  end
end
