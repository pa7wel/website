Rails.application.routes.draw do


  root "public#index"
  get 'admin', :to => "dostep#index"
 
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
