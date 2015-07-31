require 'rails_helper'

describe Quiz do

  let(:quiz)     { create(:quiz) }
  let(:user)     { create(:user) }
  let(:question) { create(:question) }

  it 'has many users' do
    #quiz.users
    quiz.users << user
    expect(quiz.users).to include(user)
  end

  it 'has many questions' do
    quiz.questions << question
    expect(quiz.questions).to include(question)
  end

  it 'must have at least one user' do
    q = build(:quiz)

    #stubbing example
    allow(q).to receive(:users) { [] }

    expect(q).to be_invalid
  end

  it 'must have at least one question' do
    q = build(:quiz)
    q.questions = []

    expect(q).to be_invalid
  end

end
