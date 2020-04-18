class GameComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :game, optional: true

  validates :comment, presence: true
  validates :comment, length: { maximum: 200 }
end
