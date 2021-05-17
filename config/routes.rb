Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"
   
  # resources :stores  do
  #   resources :articles
  #   resources :comments
  # end
  resources :stores
  resources :articles do
    resources :comments
  end

end
