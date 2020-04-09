class CreateGameComments < ActiveRecord::Migration[5.2]
  def change
    create_table :game_comments do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
