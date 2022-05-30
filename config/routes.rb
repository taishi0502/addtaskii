Rails.application.routes.draw do

  devise_for :users
  root to: "missions#index"
  resources :missions do
    resources :tasks, only: [:create]
  end
   
end
