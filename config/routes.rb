Rails.application.routes.draw do
	# scope '/admin' do
	 # scope module: 'admin' do
	 # namespace :admin do
	# resources :persons 
	# do
	# collection do 
		# member do
		# get 'preview'
		# , on: :collection
		#, on: :member
		 # end
	# end
	root 'posts#index'
  resources :sessions,:users, :posts, :likes, :comments, :saved_posts, :relationships

 #  get '/login' ,to: 'posts#index'
 #  post '/login' ,to: 'sessions#create'
 #  post '/signup' ,to: 'users#create'
	# get '/signup' ,to: 'users#signup'
	# get '/download_pdf', to: 'users#download_pdf'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  
end
