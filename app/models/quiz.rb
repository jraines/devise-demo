class Quiz < ActiveRecord::Base
  has_many :user_quizzes
  has_many :users, through: :user_quizzes

  validate :has_at_least_one_user

  def has_at_least_one_user
    errors.add(:users, 'must have one user') if users.blank?
  end
end
