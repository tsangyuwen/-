class ApplicationController < ActionController::Base
  #cart
  helper_method :current_cart
  
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def current_cart
    if !Cart.find_by(user_id: current_user)
      cart = Cart.new
      cart.user_id = current_user.id
      cart.save!
      @cart = cart
    end

    Cart.find_by(user_id: current_user)
  end

end
