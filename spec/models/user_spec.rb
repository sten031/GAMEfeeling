require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メールアドレス、パスワードがある場合、有効である" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "名前がない場合、無効である" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "メールアドレスがない場合、無効である"  do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "メールアドレスが重複している場合、無効である" do
    user1 = FactoryBot.create(:user)
    #emailの中身を同じにしてテストしている
    user2 = FactoryBot.build(:user, email: user1.email)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it "パスワードがない場合、無効である"  do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "名前が21文字以上の場合、無効である" do
    user = FactoryBot.build(:user, name: "t" * 21 )
    expect(user.invalid?).to be true
  end

  it "自己紹介が201文字以上の場合、無効である" do
    user = FactoryBot.build(:user, introduction: "t" * 201 )
    expect(user.invalid?).to be true
  end
end