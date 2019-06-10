class User < ApplicationRecord

  devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :trackable,
        :validatable,
        :confirmable

  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :authored_tests, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  #validates :email, presence: true,
                    #uniqueness: true,
                    #format: {with: URI::MailTo::EMAIL_REGEXP, message: 'Email must be format: ivan@ivanov.com' }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def test_list (level)
    tests.where(level: level)
  end

end
