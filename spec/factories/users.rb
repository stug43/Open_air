FactoryBot.define do
  factory :user do
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password { "foo_bar" }    
		address { Faker::Address.street_address + " " +
                    Faker::Address.zip_code + " " +
                     Faker::Address.city }
  end
end
