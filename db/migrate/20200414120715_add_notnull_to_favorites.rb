class AddNotnullToFavorites < ActiveRecord::Migration[5.2]
  def change
    change_column_null :favorites, :user_id, false
    change_column_null :favorites, :game_id, false
  end
end
