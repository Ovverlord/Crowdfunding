Rails.application.routes.draw do
	scope "(:locale)", locale:/ru|en/ do
		root 'campaigns#index'
		resources :campaigns

		resources :tags, only: [:index, :show]
		resources :categories
	end
end
