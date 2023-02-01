Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/', to: 'home#welcome'
  get '/sectors', to: 'sectors#index'
  get '/sectors/:id', to: 'sectors#show'
end
