class ChargesController < ApplicationController

  def new
    @order_items = current_order.order_items
  end

  def create
    order = current_order
    # Amount in cents
    @amount = (order.subtotal.to_f * 100).truncate

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    
    session.clear
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

end
