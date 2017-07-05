Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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


  #routes for logged in users
  constraints(LoggedInConstraint.new) do
    #homepage should be the users post feed
    root :to => 'posts#showall'
    #if the logged in user goes to the login page, they are redirected to their feed
    get 'login', to: redirect('/')
    #if they go to 'newpost' they get the form to create a new post
    get 'newpost' => 'posts#new'
    #'/posts' brings up the user's feed
    get 'posts' => 'posts#showall'
    #redirect '/signup' page to user's feed
    get 'signup', to: redirect('/')
  end


  #home for non-logged in users is the login page
  root :to => redirect('login')

  
  #map url /post/[insert_post_id] to display individual post view
  get 'post/:id' => 'posts#show'

  post '/newpost' => 'posts#create'

  #handle the verbs automatically when dealing with posts db
  resources :posts, path: "post"



  #map url /signup to new user page
  get 'signup' => 'users#new', :anchor => "form1-8"

  #handle the verbs automatically when dealing with users db
  resources :users, path: "user"


  
  #map url /login to start a new session
  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  #handle verbs automatically when dealing with sessions
  resources :sessions, path: "session"


  #the eternal redirect
  get '*path' => redirect('login')

end
