class FavoritesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    favorite = @game.favorites.new(user_id: current_user.id)
    favorite.save
    #redirect_to request.referer
  end

  def destroy
    @game = Game.find(params[:game_id])
    favorite = current_user.favorites.find_by(game_id: @game.id)
    favorite.destroy
    #redirect_to request.referer
  end

  private
  def redirect
    case params[:redirect_id].to_i
    when 0
      redirect_to games_path
    when 1
      redirect_to game_path(@game)
    end
  end

end
