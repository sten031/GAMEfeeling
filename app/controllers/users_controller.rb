class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit, :update, :leave]

  def index
    @users = User.all.order(created_at: :desc)
    @users = User.all.page(params[:page]).per(6)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def leave
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

  def screen_user
    if params[:id].to_i != current_user.id
      redirect_to user_path(current_user)
    end
  end
end
