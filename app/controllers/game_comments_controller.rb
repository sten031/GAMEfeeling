class GameCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @game = Game.find(params[:game_id])
    @game_new = Game.new
    @game_comment = @game.game_comments.new(game_comment_params)
    @game_comment.user_id = current_user.id
      if @game_comment.save
       redirect_to game_path(@game)
      else
        @game_comments = GameComment.where(game_id: @game.id)
        render '/games/show'
      end
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
