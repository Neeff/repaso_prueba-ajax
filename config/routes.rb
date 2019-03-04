Rails.application.routes.draw do 
  resources :songs do
    collection do
        get 'search', to: 'songs#search' 
    end
    
  end 
  root 'songs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
