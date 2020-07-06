Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "api/contacts#index"
  namespace :api do 
    resources :contacts, only: [:create]
  end
  match "*path", :to => "application#handle_404", via: [:get]
end
