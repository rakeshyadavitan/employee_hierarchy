Rails.application.routes.draw do
	resources :employees do
		collection do 
			get :hierarchy
			get :salary
			get :resign
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
