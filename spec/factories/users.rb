FactoryBot.define do
  factory :user do
    name      {Faker::Name.name}
    user_name {"abcd1011"}
    email     {Faker::Internet.free_email}
    password  {"abcd1234"}
    password_confirmation {password}
  end
end
