class User < ApplicationRecord

  has_many :passed_tests
  has_many :tests, through: :passed_tests

  validates :email, presence: true
  validates :name, presence: true

  scope :test_list, -> (level) {Test.joins("JOIN passed_tests ON
    tests.level = #{level} AND passed_tests.test_id = tests.id").select(:title) }
end
