Rails.application.routes.draw do
  resources :restaurants do
    
    # restaurants/example
    # collection is used for multiple elements
    # collection of the worst rated
    # collection of the top rated
    # etc
    collection do
      get :top
    end

    # member is used for a single element of restaurant
    member do
      get :chef
    end
    # restaurants/reviews
    resources :reviews, only: [ :new, :create]
  end

  resources :reviews, only: [ :destroy ]
end
