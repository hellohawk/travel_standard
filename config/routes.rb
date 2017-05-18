Rails.application.routes.draw do
  resources :items
  get 'maps/index'

  devise_for :users
  root   'uploads#index'

  resources :uploads do
     resources :likes, only: [:create, :destroy]
     resources :comments, only: [:create]
     get :autocomplete_search_city, :on => :collection
     get "search", to: "uploads#search", on: :collection

  #   resources :bulletins, only: [:show]
  end

  resources 'maps', only: :index do
    collection { post :import }
  end

  resources 'searches', only: :index do
    collection { post :import }
  end

  # resources :bulletins do
  #   resources :bulletins_comments, only: [:create]
  # end

  resources :users do
    resources :uploads, only: [:index]
  end

  resources :users, only: [:show]


  # resources :users, shallow: true


###

  # get    'uploads'      => 'uploads#index'
  # get    'uploads/new'  => 'uploads#new'
  # post   'uploads'      => 'uploads#create'
  # delete 'uploads/:id'  => 'uploads#destroy'
  # get    'uploads/:id/edit' => 'uploads#edit'
  # patch  'uploads/:id'  => 'uploads#update'
  # get    'uploads/:id'  => 'uploads#show'

  # get    'searchs/:id'   => 'searchs#show'
  # get    'bulletins/:id' => 'bulletins#show'
  # get    'users/:id'     => 'users#show'

##


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
