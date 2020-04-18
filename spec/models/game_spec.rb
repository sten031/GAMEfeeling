require 'rails_helper'

RSpec.describe Game, type: :model do
  it "タイトル、感想、ジャンルがある場合、有効である" do
    game = FactoryBot.build(:game)
    expect(game).to be_valid
  end

  it "タイトルがない場合、無効である" do
    game = FactoryBot.build(:game, title: nil)
    game.valid?
    expect(game.errors[:title]).to include("can't be blank")
  end

  it "感想がない場合、無効である" do
    game = FactoryBot.build(:game, feeling: nil)
    game.valid?
    expect(game.errors[:feeling]).to include("can't be blank")
  end

  it "タイトルが51文字以上の場合、無効である" do
    game = FactoryBot.build(:game, title: "t" * 51 )
    expect(game.invalid?).to be true
  end

  it "感想が201文字以上の場合、無効である" do
    game = FactoryBot.build(:game, feeling: "t" * 201 )
    expect(game.invalid?).to be true
  end
end
