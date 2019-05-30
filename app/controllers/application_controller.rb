class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	around_action :set_current_user

  def set_current_user
    User.current = current_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    User.current = nil
  end             
end
