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

require 'test_helper'

class MyEmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
