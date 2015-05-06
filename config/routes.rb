Rails.application.routes.draw do

  get '/:article', to: redirect('http://www.reddit.com')
end
