class AddNotnullToGameComments < ActiveRecord::Migration[5.2]
  def change
    change_column_null :game_comments, :user_id, false
    change_column_null :game_comments, :game_id, false
    change_column_null :game_comments, :comment, false
  end
end
