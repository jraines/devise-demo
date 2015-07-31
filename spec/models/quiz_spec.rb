require 'rails_helper'

describe Quiz do

  let(:quiz) { create(:quiz) }
  let(:user) { create(:user) }

  it 'has many users' do
    #quiz.users
    quiz.users << user
    expect(quiz.users).to include(user)
  end

  it 'must have at least one user' do
    q = Quiz.new
    expect(q).to be_invalid
    q.users << user
    expect(q).to be_valid
    q.save
    expect(q.users).to include(user)
  end

end
