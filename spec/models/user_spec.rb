require 'rails_helper'

describe User do

  let(:user) { create(:user) }
  let(:quiz) { create(:quiz) }

  it 'should have many quizzes' do
    user.quizzes << quiz

    expect(user.quizzes).to include(quiz)
  end

end
