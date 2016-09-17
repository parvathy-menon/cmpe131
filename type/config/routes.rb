Rails.application.routes.draw do
  root 'welcome#index'

  resources :typeios
  resources :users do
    resources :typeios
  end
end

