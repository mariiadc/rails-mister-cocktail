Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#home'

  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:create, :new]
    resources :ingredients, only: [:index]
    resources :reviews, only: [:create, :new]
  end

  resources :doses, only: :destroy
  resources :reviews, only: :destroy
end
