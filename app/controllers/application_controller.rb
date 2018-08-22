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
    @cart || set_cart
  end

  def set_cart
    if session[:cart_id]
      @cart = Cart.find_by(id: session[:cart_id])
    end

    @cart ||= Cart.create

    session[:cart_id] = @cart.id
    @cart
  end

end
