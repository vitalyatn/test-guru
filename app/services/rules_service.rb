class RulesService

  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end

  def give_bage
    Bage.select { |badge| send("rule_#{badge.rule}?", badge.value) }
  end


  private

  def rule_all_category_completed?(category_id)
    list_tests_general= Test.select { |test| test.category.id == category_id.to_i }
    list_user_tests = @current_user.tests.select {|test| test.category.id == category_id.to_i}
    (list_user_tests - list_tests_general).empty?
  end

  def rule_first_attempt?(value)
    @current_user.test_passages.where(test_id: @test_passage.test).count == 1 && @test_passage.successful
  end

  def rule_first_test_completed?(category_id)
    @current_user.tests.where(category_id: category_id).count == 1 &&
    @test_passage.test.category_id == category_id && @test_passage.successful
  end

  def rule_three_last_successful?(value)
   tests = @current_user.test_passages.order(created_at: :desc)[0..2]
   return false unless tests.all?{ |test| test.successful == true }
   return false if tests.pluck(:test_id).uniq.length != 3
   #tests_id = tests.pluck(:test_id).uniq if tests.pluck(:test_id).uniq.length == 3
   a = @current_user.test_passages.where(test: tests[0].test_id, successful: true).count
   b = @current_user.test_passages.where(test: tests[1].test_id, successful: true).count
   c = @current_user.test_passages.where(test: tests[2].test_id, successful: true).count
   [a, b, c].uniq.size == 1
  end

end
