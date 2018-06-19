Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'post#index'

  get 'post/index'
  get 'post/new'
  get 'post/create'
end
