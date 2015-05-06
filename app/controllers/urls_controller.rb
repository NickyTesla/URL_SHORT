class UrlsController < ApplicationController

  def show
    # redirect_to 'http://www.google.com'
  end

  def redirect
    path = params[:article]
    url = Url.where(short: path)[0].url
    if url.include?("http://") || url.include?("https://")
      redirect_to url
    else
      redirect_to 'http://' + url
    end
  end

  def create
    @url = Url.create!(url_params)
    short = Url.shorten(@url.id)
    @url[:short] = short

    if @url.save!
      render :show
    else
      redirect_to :show
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
