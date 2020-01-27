Rails.application.routes.draw do
  get '/home' => 'home#home'
  get '/about' => 'home#about',as: 'home_about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home'
  resources :books
  resources :users,only:[:show,:index,:create,:edit,:update]

end
