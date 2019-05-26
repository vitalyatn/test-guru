class User < ApplicationRecord

  has_many :passed_tests
  has_many :tests, through: :passed_tests

  def test_list(level)
    Test.joins("JOIN passed_tests ON tests.level = #{level} AND
      passed_tests.test_id = tests.id").select(:title)
  end

end
