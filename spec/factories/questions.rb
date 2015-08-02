# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    body "MyText"

    after(:build) do |q, evaluator|
      q.answers << build(:answer, correct: true)
      q.answers << build(:answer)
    end
  end
end
