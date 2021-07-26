Rails.application.routes.draw do
  get 'home/index'
  
  devise_for :users
	devise_scope :user do
		authenticated :user do
			root 'tasks#index', as: :authenticated_root
		end

		unauthenticated do
			root 'devise/sessions#new', as: :unauthenticated_root
		end
	end
	resources :comments
  resources :tasks do
    put 'start'
    put 'complete'
    put 'pausing' 
    get 'download_attachment', to: 'download_attachment'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


	