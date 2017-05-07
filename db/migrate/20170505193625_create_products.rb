class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :title
      t.text :description
      t.text :link

      t.timestamps
    end
  end
end
