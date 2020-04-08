class RenameImageColumnToGames < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :image, :image_id
  end
end
