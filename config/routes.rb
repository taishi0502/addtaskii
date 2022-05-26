Rails.application.routes.draw do
  get 'missions/index'
  root to: "missions#index"
end
