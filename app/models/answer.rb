class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_count_answers
  scope :correct_answers, -> {where(correct: true)}


  def validate_max_count_answers
    errors.add(:id, "can't add answer!") if Answer.where(question_id: question_id).count >= 4
  end
end
