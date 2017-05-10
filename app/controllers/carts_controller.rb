class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items
    @subtotal = current_order.subtotal
  end

end
