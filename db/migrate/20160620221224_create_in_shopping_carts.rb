class CreateInShoppingCarts < ActiveRecord::Migration
  def change
    create_table :in_shopping_carts do |t|
      t.references :shopping_cart, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
