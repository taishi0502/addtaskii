Rails.application.routes.draw do

  devise_for :users
  root to: "missions#index"
  resources :users, only: :show
  resources :missions do
    resources :tasks, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end
   
end
