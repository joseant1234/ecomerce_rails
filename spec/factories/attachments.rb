# == Schema Information
#
# Table name: attachments
#
#  id                   :integer          not null, primary key
#  product_id           :integer
#  archivo_file_name    :string
#  archivo_content_type :string
#  archivo_file_size    :integer
#  archivo_updated_at   :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

FactoryGirl.define do
  factory :attachment do
    product nil
  end
end
