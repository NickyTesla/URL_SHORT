Rails.application.routes.draw do
  root to: 'urls#new'
  resources :urls, only: [:create, :show]
  get '/:article', to: 'urls#redirect'
end
