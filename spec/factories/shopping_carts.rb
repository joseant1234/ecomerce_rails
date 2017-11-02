# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :string
#  ip         :string
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :shopping_cart do
    ip "127.0.0.1"
  end
end
