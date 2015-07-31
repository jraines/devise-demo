require 'rails_helper'

RSpec.describe Quiz, type: :model do

  let(:quiz) { create(:quiz) }
  let(:user) { create(:user) }

  it 'has many users' do
    quiz.users << user
    expect(quiz.users).to include(user)
  end

end
