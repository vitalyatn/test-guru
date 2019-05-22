class User < ApplicationRecord

  def test_list(level)
    title = Test.joins("JOIN passed_tests ON tests.level = #{level} AND
      passed_tests.test_id = tests.id").select(:title)
  end

end
