class UsersController < ApplicationController
  def index
  end
  def show
  end
  def edit
  end
  def update
  end
  def destroy
  end
  private
  def user_params#アクション名、メソッド
    params.require(:user).permit(:name, :introduction, :image)
  end
end
