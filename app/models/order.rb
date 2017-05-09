class Order < ApplicationRecord
  has_many :order_items
  before_save :update_subtotal

  def subtotal
    order_items.collect {|item| item.valid? ? (item.quantity * item.unit_price) : 0 }.sum
  end


private
  
  def update_subtotal
    self[:subtotal] = subtotal
  end

end
