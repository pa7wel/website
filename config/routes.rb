Rails.application.routes.draw do
  get 'zdjencies/index'

  get 'zdjencies/nowa'

  get 'zdjencies/pokaz'

  get 'zdjencies/edycja'

  get 'zdjencies/usun'

  get 'galeries/index'

  get 'galeries/nowa'

  get 'galeries/pokaz'

  get 'galeries/edycja'

  get 'galeries/usun'

  get 'artykuls/index'

  get 'artykuls/nowy'

  get 'artykuls/edycja'

  get 'artykuls/usun'

  get 'artykuls/pokaz'

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
