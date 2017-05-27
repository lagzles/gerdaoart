class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'application'

  helper_method :logged?, :has_access?

  def logged?
    session[:user_id]
  end

  def has_access?
    unless logged?
      redirect_to root_url
    end
  end
end
