Rails.application.routes.draw do

  root 'users#show'
  resources 'users'

  resources 'groups' do
    resources 'lists', shallow: true do
      resources 'items', shallow: true 
    end
  end
  

      # Prefix Verb   URI Pattern                           Controller#Action
#           root GET    /                                     users#show
#          users GET    /users(.:format)                      users#index
#                POST   /users(.:format)                      users#create
#       new_user GET    /users/new(.:format)                  users#new
#      edit_user GET    /users/:id/edit(.:format)             users#edit
#           user GET    /users/:id(.:format)                  users#show
#                PATCH  /users/:id(.:format)                  users#update
#                PUT    /users/:id(.:format)                  users#update
#                DELETE /users/:id(.:format)                  users#destroy
#     list_items GET    /lists/:list_id/items(.:format)       items#index
#                POST   /lists/:list_id/items(.:format)       items#create
#  new_list_item GET    /lists/:list_id/items/new(.:format)   items#new
#      edit_item GET    /items/:id/edit(.:format)             items#edit
#           item GET    /items/:id(.:format)                  items#show
#                PATCH  /items/:id(.:format)                  items#update
#                PUT    /items/:id(.:format)                  items#update
#                DELETE /items/:id(.:format)                  items#destroy
#     GET    /groups/:group_id/lists(.:format)     lists#index
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
