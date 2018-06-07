require 'rails_helper'

describe Product do
	before do
		@product =FactoryBot.create(:product)
		@user = FactoryBot.create(:user)
		#we can create associated models by simply using dot notation
	  @product.comments.create!(rating: 1, user: @user, body: "not good at all!")
	  @product.comments.create!(rating: 3, user: @user, body: "it was OK!")
	  @product.comments.create!(rating: 5, user: @user, body: "Great food i ever had !")
	end

	it "returns the average rating of all comments" do
		expect(@product.average_rating).to eq 3
	end

	it "is not valid without a name" do
	  expect(Product.new(description:"Nice curry")).not_to be_valid
	end
end

