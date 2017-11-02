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

FactoryGirl.define do
  factory :in_shopping_cart do
    shopping_cart nil
    product nil
  end
end
