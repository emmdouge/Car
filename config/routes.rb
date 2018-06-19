Rails.application.routes.draw do

  resources :person

  get '/automobile/sale' => 'automobile#sale', :as => :automobile_sale
  resources :automobile

  
  get '/ownership/own/:person_id' => 'ownership#own', :as => :ownership_owned
  get '/ownership/curr_owner/:automobile_id' => 'ownership#curr_owner', :as => :ownership_curr_owner
  get '/ownership/car_history/:automobile_id' => 'ownership#car_history', :as => :ownership_car_history
  get '/ownership/owner_history/:person_id' => 'ownership#owner_history', :as => :ownership_owner_history
  resources :ownership
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
