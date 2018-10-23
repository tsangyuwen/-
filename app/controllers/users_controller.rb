class UsersController < ApplicationController
  # before_action :confirm_process, only: :edit_member

  def confirm_password
    @user = current_user
  end

  def confirm
    @user = current_user

    if @user.valid_password?(password_params.values.first)
      flash[:notice] = "success"
      confirm_process(false)
    else
      flash.now[:alert] = "輸入錯誤，請再輸入一次"
      render :confirm_password
    end
  end

  def edit_member
    @user = current_user
  end

  def update_member
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = "success"
      redirect_to users_path
    else
      flash.now[:alert] = "failed"
      render :update_member
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :address, :phone, :tax_id)
  end

  def password_params
    params.require(:user).permit(:password)
  end

  def confirm_process(result = true)
    if result
      redirect_to confirm_password_users_url
    else
      render :edit_member
    end
  end
end
