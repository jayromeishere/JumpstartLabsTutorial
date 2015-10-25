Rails.application.routes.draw do
    root to: 'articles#index'
    resources :articles do
        resources :comments
    end
    resources :tags #initializes the RESTful controller actions for the collection named 
end
