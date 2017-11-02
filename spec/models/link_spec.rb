require 'rails_helper'

RSpec.describe Link, type: :model do
	it{ should belong_to :product }
	it "should generate a custom id" do
		link = FactoryGirl.create(:link)
		expext(link.custom_id).to_not be_nil
		puts link.custom_id
	end

	it "should send an email" do
		expect{
			link = FactoryGirl.create(:link)
		}.to change(ActionMailer::Base.deliveries, :count.by(1)
	end

	describe "#create_attachment_links" do
		before :each do
			@product = FactoryGirl.create(:product)
			3.times do
				@attachment = FactoryGirl.create(:attachment, product: @product)
			end
			@link = FactoryGirl.create(:link,product: @product)
		end
		it "should generate a link per product attachent" do
			expect{
				@link.create_attachment_links
			}.to change(LinkAttachment,:count).by(3)
		end
	end
end
