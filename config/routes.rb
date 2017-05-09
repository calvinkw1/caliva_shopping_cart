Rails.application.routes.draw do

  resources :products, only: [:show, :index]
  resources :order_items, only: [:create, :update, :destroy]

  get '/', to: 'products#index'
  
  get 'carts/show'

#      Prefix Verb   URI Pattern                Controller#Action
#    products GET    /products(.:format)        products#index
#     product GET    /products/:id(.:format)    products#show
# order_items POST   /order_items(.:format)     order_items#create
#  order_item PATCH  /order_items/:id(.:format) order_items#update
#             PUT    /order_items/:id(.:format) order_items#update
#             DELETE /order_items/:id(.:format) order_items#destroy
#             GET    /                          products#index
#  carts_show GET    /carts/show(.:format)      carts#show

end
