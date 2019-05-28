class User < ApplicationRecord

  has_many :passed_tests, dependent: :nullify
  has_many :tests, through: :passed_tests, dependent: :nullify
  belongs_to :author, class_name: "User"

  validates :email, :name, presence: true


  scope :test_list, -> (level) {
    Test.joins(:passed_tests).where(tests: {level: level }).select(:title) }

end
