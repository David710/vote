Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/avis', to: 'messages#affichage'
  get '/admin', to: 'admins#index'
  delete '/admin/delete', to: 'admins#delete'

  root "messages#index"
end
