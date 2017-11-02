class ChangeStatusColumnToStringInShoppingCarts < ActiveRecord::Migration
  def change
  	change_column :shopping_carts, :status, :string
  end
end
