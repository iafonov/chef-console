ChefConsole::Application.routes.draw do
  resources :nodes
  resources :clients

  root :to => "application#index"
end
