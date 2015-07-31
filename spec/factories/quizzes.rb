# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz do
    name "MyString"

    after(:build) do |quiz, evaluator|
      quiz.users << build(:user)
    end

    after(:build) do |quiz, evaluator|
      quiz.questions << build(:question)
    end

  end
end
