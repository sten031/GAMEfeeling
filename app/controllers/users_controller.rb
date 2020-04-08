class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  def destroy
  end
  private
  def user_params#アクション名、メソッド
    params.require(:user).permit(:name, :introduction, :image)
  end
end
