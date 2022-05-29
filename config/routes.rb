Rails.application.routes.draw do

  root to: "missions#index"
  resources :missions do
    resources :tasks, only: [:create]
  end
   
end
