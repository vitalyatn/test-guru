class User < ApplicationRecord

  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :authored_tests, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  validates :email, :name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def test_list (level)
    tests.where(level: level)
  end

end
