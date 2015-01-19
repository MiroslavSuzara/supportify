Rails.application.routes.draw do

  get "/support_requests/new" => "support_requests#new", as: :new_support_request
  post "/support_requests" => "support_requests#create", as: :support_requests
  get "/support_requests/:id" => "support_requests#show", as: :support_request
  get "/support_requests" => "support_requests#index"
  get "/support_requests/:id/edit" => "support_requests#edit", as: :edit_support_request
  patch "/support_requests/:id" => "support_requests#update"
  patch "/support_requests/done/:id" => "support_requests#done", as: :done_support_request
  delete "/support_requests/:id" => "support_requests#destroy"
  get "/about" => "about#index"

  root "support_requests#index"

end

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

