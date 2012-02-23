ChefConsole::Application.routes.draw do
  resources :nodes
  root :to => "application#index"
end
