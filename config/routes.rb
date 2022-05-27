Rails.application.routes.draw do
  get 'missions/index'
  root to: "missions#index"
  resources :missions, only: [:index, :new, :create, :edit, :update, :destroy]
end
