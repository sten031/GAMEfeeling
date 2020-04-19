class Game < ApplicationRecord
  belongs_to :user, optional: true
  has_many :game_comments
  has_many :favorites

  attachment :image, destroy: false
  enum genre:[:その他,:アクション,:シューティング,:アドベンチャー,:ロールプレイング,:パズル,:レースゲーム,:シミュレーション,:リズムゲーム,:スポーツ]

  validates :title, presence: true, length: { maximum: 50 }
  validates :feeling, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
