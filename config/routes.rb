Rails.application.routes.draw do

  devise_for :users
  root to: "missions#index"
  resources :rooms, only: [:index, :new, :create]do
    member do 
      get 'join'
    end
  end
  resources :users, only: [:show] do
    resources :ranks, only: [:index]
  end
  resources :missions do
    resources :tasks, only: [:create]
    resource :favorites, only: [:create, :destroy]

    collection do
      get 'search'
    end
    
      member do
        get 'levelup'
      end


    

  end




   
end
