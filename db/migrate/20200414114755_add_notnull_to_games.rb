class AddNotnullToGames < ActiveRecord::Migration[5.2]
  def change
    change_column_null :games, :title, false
    change_column_null :games, :feeling, false
    change_column_null :games, :user_id, false
  end
end
