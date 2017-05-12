require 'rails_helper'
require 'pry'

RSpec.describe Product, type: :model do  

    product = {
      title: "Test Title",
      description: "Test description",
      price: 0.13999e3,
      image_url: "https://www.google.com/test.jpg",
      link: "https://www.google.com/test"
    }

  it 'creates a new product' do
    expect(Product.create(product)).to be_truthy
  end

  it 'checks for an existing product' do
    existing_product = {
      title: "Nanoleaf Aurora 9-panel LED Started Kit $139.99 at Fry's with Monday's Promo Code 5/08",
      description: "Frys.com has *Nanoleaf Aurora Smarter Lighting Kit* on sale for *$139.99* when you apply your unique Email Promo Code (sign up for future promo code Deals here) during checkout. *Shipping is free* or...",
      price: 0.13999e3,
      image_url: "https://static.slickdealscdn.com/attachment//9/4/8/1/2/8/200x200/5506824.thumb",
      link: "https://slickdeals.net/f/10131804-nanoleaf-aurora-9-panel-led-started-kit-139-99-at-fry-s-with-monday-s-promo-code-5-08?utm_source=rss&utm_content=fp&utm_medium=RSS2"
    }

    expect(Product.product_exists?(product)).to be_falsey
    expect(Product.product_exists?(existing_product)).to be_truthy
  end




end