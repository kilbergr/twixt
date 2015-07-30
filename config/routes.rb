
Rails.application.routes.draw do

 
# ======================
# ==== ROOT ROUTE ======
# ======================
  root 'sessions#login'

# ================================================
# ==== GROUPS AND LISTS (NESTED, SHALLOW) ========
# ================================================
  resources 'groups' do 
    resources 'lists', shallow: true
  end

# =================================
# ==== PASSWORD RESET ROUTES ======
# =================================  
  resources :resets, only: [:new, :edit, :create, :update]

# =========================
# ==== SIGNUP ROUTES ======
# =========================	
  get '/signup' => 'sessions#signup', as: 'user_signup'
  post '/signup' => 'sessions#create'
  
# =========================
# ==== OAUTH ROUTE ========
# =========================  
  get '/auth/:provider/callback' => 'sessions#auth'

# =========================
# ==== LOGIN ROUTES =======
# =========================  
  get '/login' => 'sessions#login', as: 'login'
  post '/login', to: 'sessions#attempt_login'

# =========================
# ==== LOGOUT ROUTE =======
# =========================
  delete '/logout' => 'sessions#logout', as: 'logout'

# =========================
# ==== USER ROUTES ========
# =========================
  get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/update' => 'users#update'
  put '/users/update' => 'users#update'
  delete 'users/:id' => 'users#destroy'

# =========================
# ==== ITEM ROUTES ========
# =========================
  get  '/lists/:list_id/items' => 'items#index' #JSON ONLY?
  post '/lists/:list_id/items' => 'items#create'
  get  '/items/:id/edit' => 'items#edit', as: 'edit_item' 

# ==================================
# ==== NOTIFICATIONS ROUTES ========
# ==================================

  post '/notifications' => 'notifications#create'

end

#        prefix Verb   URI Pattern                           Controller#Action
       
#           root GET    /                                     sessions#login
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
#         resets POST   /resets(.:format)                     resets#create
#      new_reset GET    /resets/new(.:format)                 resets#new
#     edit_reset GET    /resets/:id/edit(.:format)            resets#edit
#          reset PATCH  /resets/:id(.:format)                 resets#update
#                PUT    /resets/:id(.:format)                 resets#update
#  notifications POST   /notifications(.:format)              notifications#create



