class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers
  accepts_nested_attributes_for :answers
  validates_presence_of :answers
end
