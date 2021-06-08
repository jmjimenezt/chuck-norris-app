Rails.application.routes.draw do

  scope '/(:locale)', defaults: { locale: 'en' }, constraints: { locale: /en|es/ } do
    resources :search_results # Add restrictions
    resources :jokes

    root "search_results#new"

  end

  patch 'send_results/:id', to: 'search_results#send_results'

end
