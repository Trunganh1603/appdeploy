Rails.application.routes.draw do

  get 'notifications/:id/link_through', to: 'notifications#link_through',
                                        as: :link_through
  get 'notifications', to: 'notifications#index'
  get 'profiles/show'
  
  root to: 'posts#index'

  devise_for :users, :controllers => {registrations: 'registrations'}
  
	resources :posts do
		resources :comments
		member	do
			get	'like' => "posts#like"
			get	'unlike' => "posts#unlike"
		end	
	end
	
	resources :notifications

	mount ActionCable.server => '/cable'

	# Existing route id to user_name
	get	':user_name', to: 'profiles#show', as: :profile
	# New route edit_profile
	get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
	#New routes update_profile
	patch ':user_name/edit', to: 'profiles#update', as: :update_profile
end
