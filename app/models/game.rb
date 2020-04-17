class Game < ApplicationRecord
  belongs_to :user
  has_many :game_comments
  has_many :favorites

  attachment :image, destroy: false
  enum genre:[:その他,:アクション,:シューティング,:アドベンチャー,:ロールプレイング,:パズル,:レースゲーム,:シュミレーション,:リズムゲーム,:スポーツ]

  validates :title, presence: true
  validates :feeling, presence: true
  validates :feeling, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
