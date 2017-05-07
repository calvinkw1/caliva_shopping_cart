Rails.application.routes.draw do
  resources :products
  get '/', to: 'products#index'
  # calling retrieve_feed method from products#index so this is
  # no longer needed unless you want to hit the feed method directly
  # get '/feed', to: 'products#retrieve_feed' 
  
#         Prefix Verb   URI Pattern                  Controller#Action
#     products GET    /products(.:format)          products#index
#              POST   /products(.:format)          products#create
#  new_product GET    /products/new(.:format)      products#new
# edit_product GET    /products/:id/edit(.:format) products#edit
#      product GET    /products/:id(.:format)      products#show
#              PATCH  /products/:id(.:format)      products#update
#              PUT    /products/:id(.:format)      products#update
#              DELETE /products/:id(.:format)      products#destroy

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
