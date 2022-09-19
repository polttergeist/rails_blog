Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  	root "pages#index"
  	get "about", to: "pages#about"
  	resources :articles

  scope 'api/v1' do
    resources :articles, controller: 'api/v1/formats', as: :formats
	end
end
