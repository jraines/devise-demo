class Quiz < ActiveRecord::Base
  has_many :user_quizzes
  has_many :users, through: :user_quizzes
  has_many :questions

  accepts_nested_attributes_for :questions

  validates_presence_of :questions, :users


  def has_at_least_one_user
    errors.add(:users, 'must have one user') if users.blank?
  end
end
