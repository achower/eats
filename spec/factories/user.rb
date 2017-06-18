FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@gmail.com"
  end

end

FactoryGirl.define do
  factory :user, class: 'User' do
    first_name 'first'
    last_name 'last'
    email
    password '123456'
    password_confirmation '123456'
  end
end
