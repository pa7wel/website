Rails.application.routes.draw do
  get 'stronas/index'

  get 'stronas/pokaz'

  get 'stronas/nowa'

  get 'stronas/edycja'

  get 'stronas/usun'

  get 'kategories/index'

  get 'kategories/pokaz'

  get 'kategories/nowa'

  get 'kategories/edycja'

  get 'kategories/usun'

  match ':controller(/:action(/:id))', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
