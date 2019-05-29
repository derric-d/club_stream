class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_back(fallback_location: root_path)
      # redirect_back(fallback_location: preferences_path)
    else
      render 'pages/preferences'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :tag_list) ## Rails 4 strong params usage
  end
end
