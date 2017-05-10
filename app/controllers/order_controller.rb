class OrderController < ApplicationController

  def show
    @order = Order.find params["order"]["order_item_ids"]
    @order_items = @order.order_items
  end

end
