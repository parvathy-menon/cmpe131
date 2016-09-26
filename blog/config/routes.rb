Rails.application.routes.draw do
  resources :posts do
 	resources :comments, :only => :create
  end

  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'
  root 'posts#index'

end
