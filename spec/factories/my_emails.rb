# == Schema Information
#
# Table name: my_emails
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  state      :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :my_email do
    email "MyString"
    ip "MyString"
    state 1
  end
end
