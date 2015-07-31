class Quiz < ActiveRecord::Base
  has_many :user_quizzes
  has_many :users, through: :user_quizzes
end
