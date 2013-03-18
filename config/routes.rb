Liquorcabby::Application.routes.draw do
  root :to => 'home#index'

  resources :cocktails do
    member do
      post :favorite
    end
    collection do
      get :favorites
      get :top_rated
    end
  end

  resources :users, :except => [:index, :destroy]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
