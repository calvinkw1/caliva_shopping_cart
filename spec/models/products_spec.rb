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
    expect(Product.product_exists?(product)).to be_falsey
  end


end