ChefConsole::Application.routes.draw do
  resources :nodes do
    resource :attributes
  end
  resources :clients

  root :to => "application#index"
end
