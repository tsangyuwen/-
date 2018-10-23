class Ajion2596dhi::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    @users = User.all
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "success"
      redirect_to ajion2596dhi_users_path
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end
