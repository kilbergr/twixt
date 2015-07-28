Rails.application.routes.draw do

	#signup routes
  get '/signup' => 'sessions#signup'
  post '/signup' => 'sessions#create'

  get "/auth/:provider/callback" => 'sessions#auth'

  #login routes
  get '/login' => 'sessions#login', as: "login"
  post '/login', to: "sessions#attempt_login"
  #logout route
  delete '/logout' => 'sessions#logout', as: "logout"

  root 'sessions#login'

  get '/users/:id' => 'users#show', as: "user"
  #edit and update user routes
  get 'users/:id/edit' => 'users#edit', as: 'edit_user'
  patch 'users/update' => 'users#update'
  put 'users/update' => 'users#update'


  #delete user profile
  delete 'users/:id' => 'users#destroy'

  get 'lists/:list_id/items' => 'items#index'



  resources 'groups' do 
  	resources 'lists', shallow: true 
      # resources 'items', shallow: true 
    # end
  end
  

      # Prefix Verb   URI Pattern                           Controller#Action
#                 Prefix Verb   URI Pattern                           Controller#Action
#         signup GET    /signup(.:format)                     sessions#signup
#                POST   /signup(.:format)                     sessions#create
#          login GET    /login(.:format)                      sessions#login
#                POST   /login(.:format)                      sessions#attempt_login
#         logout DELETE /logout(.:format)                     sessions#logout
#           root GET    /                                     sessions#login
#                GET    /users/:id(.:format)                  users#show
#      edit_user GET    /users/:id/edit(.:format)             users#edit
#   users_update PATCH  /users/update(.:format)               users#update
#                PUT    /users/update(.:format)               users#update
#                DELETE /users/:id(.:format)                  users#destroy
#     list_items GET    /lists/:list_id/items(.:format)       items#index
#                POST   /lists/:list_id/items(.:format)       items#create
#  new_list_item GET    /lists/:list_id/items/new(.:format)   items#new
#      edit_item GET    /items/:id/edit(.:format)             items#edit
#           item GET    /items/:id(.:format)                  items#show
#                PATCH  /items/:id(.:format)                  items#update
#                PUT    /items/:id(.:format)                  items#update
#                DELETE /items/:id(.:format)                  items#destroy
#    group_lists GET    /groups/:group_id/lists(.:format)     lists#index
#                POST   /groups/:group_id/lists(.:format)     lists#create
# new_group_list GET    /groups/:group_id/lists/new(.:format) lists#new
#      edit_list GET    /lists/:id/edit(.:format)             lists#edit
#           list GET    /lists/:id(.:format)                  lists#show
#                PATCH  /lists/:id(.:format)                  lists#update
#                PUT    /lists/:id(.:format)                  lists#update
#                DELETE /lists/:id(.:format)                  lists#destroy
#         groups GET    /groups(.:format)                     groups#index
#                POST   /groups(.:format)                     groups#create
#      new_group GET    /groups/new(.:format)                 groups#new
#     edit_group GET    /groups/:id/edit(.:format)            groups#edit
#          group GET    /groups/:id(.:format)                 groups#show
#                PATCH  /groups/:id(.:format)                 groups#update
#                PUT    /groups/:id(.:format)                 groups#update
#                DELETE /groups/:id(.:format)                 groups#destroy
end