Rails.application.routes.draw do
	scope "(:locale)", locale:/ru|en/ do
		root 'campaigns#index'
		resources :campaigns

		resources :tags, only: [:show]
	end
end
