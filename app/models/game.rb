class Game < ApplicationRecord
  belongs_to :user, optional: true
  has_many :game_comments
  has_many :favorites

  attachment :image, destroy: false
  enum genre: {
    :その他 => 0, :アクション => 1, :シューティング => 2, :アドベンチャー => 3,
    :ロールプレイング => 4, :パズル => 5, :レースゲーム => 6, :シミュレーション => 7, :リズムゲーム => 8, :スポーツ => 9,
  }

  validates :title, presence: true, length: { maximum: 50 }
  validates :feeling, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
