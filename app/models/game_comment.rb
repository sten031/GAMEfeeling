class GameComment < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :comment, presence: true
  validates :comment, length: { maximum: 200 }
end
