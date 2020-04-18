class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit, :update]
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      redirect_to games_path(@game.id)
    else
      @game.user_id = current_user.id
      render 'new'
    end
  end

  def index
    @games = Game.all
  end

  def edit
    @game = Game.find(params[:id])
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
    @game_comments = @game.game_comments
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end
  private
  def game_params #アクション名、メソッド
    params.require(:game).permit(:title, :image, :feeling, :genre)
  end

  def screen_user
    unless params[:id].to_i == current_user.id
      redirect_to games_path
    end
  end
end
