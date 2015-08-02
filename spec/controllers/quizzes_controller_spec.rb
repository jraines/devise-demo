require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do

  describe "GET #new" do
    it "should create a new quiz" do
      get :new
      expect(assigns(:quiz)).to be_present
    end
  end

  describe "POST #create" do

    let(:user) { create(:user) }

    before do
      sign_in(user)
    end

    it "should create a basic quiz" do
      post :create, { quiz: {
                        name: 'New quiz',
                        questions_attributes: {
                          '0' => {
                            body: 'To be or nah?',
                            answers_attributes: {
                              '0' => { body: 'Sure',
                                       correct: true }
                            }
                          }
                        }
                      }
                    }
      expect(Quiz.count).to be(1)
    end

  end
end
