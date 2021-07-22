Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks do
    put 'start'
    put 'complete'
    put 'pausing'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


	