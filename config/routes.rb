Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/avis', to: 'messages#affichage'

  root "messages#index"
end
