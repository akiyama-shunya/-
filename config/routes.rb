Seleclothes::Application.routes.draw do
	#認証なし(ログインページ込み)でアクセスここから↓
	root 'pages#home'
	devise_for :users, path_names: {sign_in: "sign_in", sign_out: "sign_out"},
	controllers: {
	omniauth_callbacks: 'users/omniauth_callbacks'
	 }
	 devise_for :designers
	#match'/', to: 'users#home',				via: 'get'
	match '/sign_up', to: 'designers/registrations#new',	via: 'get'
	match'/sign_up', to: 'devise/registrations#new',	via: 'get'
	match '/help', to: 'pages#help',					via: 'get'
	match '/about', to: 'pages#about',					via: 'get'
	#ここまで↑
	
	#ログイン後アクセスここから↓
	get "index", to: "members#index", as: "members_root"
	match '/index_d', to: 'images#index_d',				via: 'get'
	resources :images
	resources :images do
		member do
			get 'show_image'
		end
	end
	#match '/images/:id', to: 'images#show',		via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
