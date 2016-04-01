Rails.application.routes.draw do
  devise_for :users

  resources :topics, only: [:create, :index, :show]

end
