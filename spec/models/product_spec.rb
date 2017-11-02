# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  pricing             :integer
#  description         :text
#  user_id             :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime
#  updated_at          :datetime
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :user }
  it { should validate_presence_of :pricing }

  if "should validate pricing > 0" do
  	#build lo crea en la memoria, create crea en la BD
  	product = Factory.build(:product, pricing: 0 )
  	expect(product.valid?).to be_falsy
  end
end
