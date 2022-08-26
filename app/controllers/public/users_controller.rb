class Public::UsersController < ApplicationController
  def show
    @user = User.find(params)
    @posts = @user.posts
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

end
