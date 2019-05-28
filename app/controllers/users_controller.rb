class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :tag_list) ## Rails 4 strong params usage
  end
end
