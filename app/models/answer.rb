class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_count_answers
  scope :correct, -> { where(correct: true) }


  def validate_max_count_answers
    errors.add(:base, "can't add answer!") if question.answers.count >= 4
  end
end
