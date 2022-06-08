Rails.application.routes.draw do
  get 'post/index'
  get 'post/search'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "featured_content#index"
  get "/show" => "featured_content#show", as: :show_path
  # Defines the root path route ("/")
  # root "articles#index"
  
  # Routes Search
  get '/busca' => 'searchs#index', as: :searchs
  get '/busca/resultados' => 'searchs#search', as: :search

  # Routes for Post
  resources :post do
    collection do 
      post :search
    end
  end
  get '/post/:id', to: 'post#show', as: 'post_show'
end
