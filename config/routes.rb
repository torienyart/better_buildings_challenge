Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/', to: 'home#welcome'
  get '/sectors', to: 'sectors#index'
  get '/sectors/new', to: 'sectors#new'
  get '/sectors/:id', to: 'sectors#show'
  post '/sectors', to: 'sectors#create'
  get '/sectors/:id/edit', to: 'sectors#edit'
  patch '/sectors/:id', to: 'sectors#update'

  get '/partners', to: 'partners#index'
  get '/partners/:id', to: 'partners#show'
  get '/partners/:id/edit', to: 'partners#edit'
  patch '/partners/:id', to: 'partners#update'

  get '/sectors/:id/partners', to: 'sector_partners#index'
  get '/sectors/:id/partners/new', to: 'sector_partners#new'
  post '/sectors/:id/partners', to: 'sector_partners#create'

end
