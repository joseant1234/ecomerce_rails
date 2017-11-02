# == Schema Information
#
# Table name: in_shopping_carts
#
#  id               :integer          not null, primary key
#  shopping_cart_id :integer
#  product_id       :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class InShoppingCart < ActiveRecord::Base
  belongs_to :shopping_cart
  belongs_to :product
  #dado que no hay una relacion entre in_shopping_carts y users, para ver el dueño usuario del producto se puede hacerlo a través de through: :product
  has_one :user, through: :product
end
