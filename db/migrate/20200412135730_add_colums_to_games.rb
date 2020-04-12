class AddColumsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :genre, :integer, default: 0, null: false
  end
end
