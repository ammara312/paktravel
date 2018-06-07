FactoryBot.define do
	sequence(:email) { |n| "user#{n}@example.com" }
  factory :user do
    email
    password "123456"
    first_name "userfortesting"
    last_name "example"
    admin false
  end


  factory :admin, parent: :user do
	  id
	  admin true
  end
end