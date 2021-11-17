Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :boards do
    resources :cells do
      member do
        put :delete_picture
      end
    end
  end

  resources :cells, only: :index

  resources :teams

  resources :events

  mount Commontator::Engine => '/commontator'

  root to: "boards#index"

end
