Peer::Application.routes.draw do
  resources :posts, except: :index do
    member do
      post "comment", to: "posts#comment", as: :comment
      post "score", to: "posts#score", as: :score
      get "unscore", to: "posts#unscore", as: :unscore
      get "like", to: "posts#like", as: :like
      get "unlike", to: "posts#unlike", as: :unlike
      get "top", to: "posts#top", as: :top
      get "untop", to: "posts#untop", as: :untop
    end
  end

  get "/setting", to: "posts#setting", as: :setting
  get "/setting/:key/:value", to: "posts#save_setting", as: :save_setting

  get "/my", to: "posts#my", as: :my_posts
  get "/scored", to: "posts#scored", as: :scored_posts
  get "/favorite", to: "posts#favorite", as: :favorite_posts
  delete "/comments/:comment_id", to: "posts#destroy_comment", as: :delete_comment

  get "/sign_out", to: "application#logout", as: :logout
  root "posts#index"

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
