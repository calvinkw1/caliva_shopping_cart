class ChangeProductsPriceDataType < ActiveRecord::Migration[5.1]
  def change
    execute 'ALTER TABLE products ALTER COLUMN price TYPE decimal(12,3) USING (price::decimal)'
  end
end
