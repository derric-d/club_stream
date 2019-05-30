class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    tags = params[:user][:tag_list]
    @user.tag_list = tags
    if @user.save
      redirect_to whatsapp_path
    else
      render 'pages/preferences'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :tag_lists) ## Rails 4 strong params usage
  end
end
