Rails.application.routes.draw do
  namespace :api do
    get 'typeahead/:input',to:'typeahead#index'
  end

  namespace :api do 
    resources :users
    resources :typeahead
  end
  
end
