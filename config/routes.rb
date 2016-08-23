Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/avis', to: 'messages#affichage'
  get '/admin', to: 'admins#index'
  delete '/admin/delete', to: 'admins#delete'
  post '/admin/update', to: 'admins#update'

  root "messages#index"
end
