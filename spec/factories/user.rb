FactoryGirl.define do
  factory :user do

    sequence :email do |n|
      "test#{n}@example.com"
    end

    password "a;oiwefnawoief"

  end
end

