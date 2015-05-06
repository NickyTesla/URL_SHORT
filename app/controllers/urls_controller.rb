class UrlsController < ApplicationController

  def show
    # redirect_to 'http://www.google.com'
  end

  def redirect
    redirect_to 'http://www.google.com'
  end

  def create
    @url = Url.new(url_params)
    short = Url.shorten(params[:url])
    @url[:short] = short
    if @url.save!
      render :show
    else
      render :show
    end

  end

  def new
    @url = Url.new
    render :new
  end

  private

  def url_params
    params.permit(:url)
  end


end
