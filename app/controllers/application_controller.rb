class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :correct_domain!

  private
  def correct_domain!
    unless request.host == 'www.mysite.com'
      redirect_to root_url, :status => 301
    end
  end


end
