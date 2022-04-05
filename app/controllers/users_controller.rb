class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path, notice: "Profile was successfully updated."
    else
      render :edit_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :profile, :profile_image_id)
  end
end
