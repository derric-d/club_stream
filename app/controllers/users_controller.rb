class UsersController < ApplicationController

  private

  def user_params
    params.require(:user).permit(:username, :tag_list) ## Rails 4 strong params usage
  end
end
