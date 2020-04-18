require 'rails_helper'

RSpec.describe GameComment, type: :model do
  it "コメントがある場合、有効である" do
    game_comment = FactoryBot.build(:game_comment)
    expect(game_comment).to be_valid
  end

  it "コメントが201文字以上の場合、無効である" do
    game_comment = FactoryBot.build(:game_comment, comment: "t" * 201 )
    expect(game_comment.invalid?).to be true
  end
end
