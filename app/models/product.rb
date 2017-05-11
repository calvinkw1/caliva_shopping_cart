class Product < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :link, presence: true
  validates :price, presence: true, format: { with: /[0-9]+(?:\.[0-9]{2})?/ }
  validates :image_url, presence: true

  require 'rss'

  def self.retrieve_feed
    url = 'https://slickdeals.net/newsearch.php?mode=frontpage&searcharea=deals&searchin=first&rss=1'
    rss = RSS::Parser.parse url, true
    rss.items.each do |item|
      binding.pry
      price = extract_price_from_title item.title
      product = {
        title: item.title,
        description: item.description,
        price: price,
        image_url: item.content_encoded.scan(/(?<=src\=\")(.*thumb)/)[0][0], # grabbing thumbnail image from encoded data. this was also not easily referenced in xml doc from Slickdeals
        link: item.link
      }
      Product.create product unless product_exists? product
    end
  end

  def self.extract_price_from_title title
    price = title.scan(/\$[0-9]+(?:\.[0-9]{2})?|free/i)[0] # extract price from title as RSS feed XML doesn't have "Price" node
    price ? price[0] = '' : price = "0" # removing '$' from price for easier conversion to currency format later (number_to_currency method to be used in view)
    return price
  end

  def self.product_exists? product
    Product.find_by title: product[:title]
  end

end
