Rails.application.routes.draw do
	root 'sessions#home'
  # 
  resources :sessions,:users

  get '/login' ,to: 'sessions#login'
  post '/login' ,to: 'sessions#create'
  post '/signup' ,to: 'users#create'
	get '/signup' ,to: 'users#signup'
	# get '/download_pdf', to: 'users#download_pdf'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
