Rails.application.routes.draw do

  get '/person/:id' => 'person#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
