class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_cart_or_create
    c = current_cart
    if c.new_record?
      c.save
      session[:order_id] = c.id
    end
    c
  end
end
