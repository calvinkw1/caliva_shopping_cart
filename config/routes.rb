Rails.application.routes.draw do

  get 'order/show', to: 'order#show'

  resources :products, only: [:show, :index]
  resources :order_items, only: [:create, :update, :destroy]
  resources :charges

  get '/', to: 'products#index'
  
  get 'carts/show'

#      Prefix Verb   URI Pattern                 Controller#Action
#    products GET    /products(.:format)         products#index
#     product GET    /products/:id(.:format)     products#show
# order_items POST   /order_items(.:format)      order_items#create
#  order_item PATCH  /order_items/:id(.:format)  order_items#update
#             PUT    /order_items/:id(.:format)  order_items#update
#             DELETE /order_items/:id(.:format)  order_items#destroy
#     charges GET    /charges(.:format)          charges#index
#             POST   /charges(.:format)          charges#create
#  new_charge GET    /charges/new(.:format)      charges#new
# edit_charge GET    /charges/:id/edit(.:format) charges#edit
#      charge GET    /charges/:id(.:format)      charges#show
#             PATCH  /charges/:id(.:format)      charges#update
#             PUT    /charges/:id(.:format)      charges#update
#             DELETE /charges/:id(.:format)      charges#destroy
#             GET    /                           products#index
#  carts_show GET    /carts/show(.:format)       carts#show

end
