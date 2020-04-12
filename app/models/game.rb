class Game < ApplicationRecord
  belongs_to :user
  attachment :image, destroy: false
  has_many :game_comments
  has_many :favorites
  enum genre:[:その他,:アクション,:シューティング,:アドベンチャー,:ロールプレイング,:パズル,:レースゲーム,:シュミレーション,:リズムゲーム,:スポーツ]
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
