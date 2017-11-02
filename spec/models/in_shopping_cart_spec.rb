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

require 'rails_helper'

RSpec.describe InShoppingCart, type: :model do
  it { should belong_to :product }
  it { should belong_to :shopping_cart }
  it { should have_one :user } #El owner del producto
end

