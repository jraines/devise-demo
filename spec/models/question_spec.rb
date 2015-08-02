require 'rails_helper'

RSpec.describe Question, type: :model do

  let(:quiz)     { create(:quiz) }
  let(:user)     { create(:user) }
  let(:question) { create(:question) }

  it 'has many answers' do
    expect(question.answers).to be_present
  end

  it 'must have at least one answer' do
    q = build(:question)
    q.answers = []

    expect(q).to be_invalid
  end

end
