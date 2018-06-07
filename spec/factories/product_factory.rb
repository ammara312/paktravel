FactoryBot.define do
	sequence(:id) { |n| "#{n}" }

	factory :product do
		name "Example Dishes"
		image_url "Croisants.jpg"
		price  "4.99"
	end
end