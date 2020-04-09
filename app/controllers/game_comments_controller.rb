class GameCommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game_new = Game.new
    @game_comment = @game.game_comments.new(game_comment_params)
    @game_comment.user_id = current_user.id
    @game_comment.save
    redirect_to game_path(@game)
  end

  def destroy
    @game_comment = GameComment.find(params[:game_id])
    @game_comment.user != current_user
    @game_comment.destroy
    redirect_to request.referer
  end

  private
  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end
end
