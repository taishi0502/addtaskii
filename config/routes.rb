Rails.application.routes.draw do
  get 'missions/index'
  root to: "missions#index"
  resources :missions, only: [:index, :new, :create, :edit, :update, :destroy]do
  resources :tasks, only: [:index, :new, :create]
  end
end
