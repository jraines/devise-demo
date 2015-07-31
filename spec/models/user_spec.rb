require 'rails_helper'

describe User do

  let(:user)    { create(:user) }
  let(:quizzes) { create_list(:quiz, 2) }

  it 'should have many quizzes' do
    quizzes.each do |quiz|
      user.quizzes << quiz
    end

    quizzes.each do |quiz|
      expect(user.quizzes).to include(quiz)
    end
  end

end
