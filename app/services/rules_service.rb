class RulesService

  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end

  def give_bage
    Bage.select { |bage| send("rule_#{bage.rule}?", bage) }
  end

  private

  def rule_all_category_completed?(bage)
    category_id = bage.value
    return check_category_and_successful?(category_id.to_i)
    list_tests_general = Test.where(category_id: category_id)
    list_user_tests = @current_user.tests.where(category_id: category_id)
    if (list_user_tests - list_tests_general).empty?
      list_tests_general.pluck(:id) == list_user_tests.pluck(:id).uniq &&
        list_user_tests.pluck(:id).group_by(&:itself).values.map(&:size).uniq.size == 1
    end
  end

  def rule_first_attempt?(bage)
    @current_user.test_passages.where(test_id: @test_passage.test).count == 1 && @test_passage.successful
  end

  def rule_first_test_completed?(bage)
    category_id = bage.value
    return check_category_and_successful?(category_id.to_i)
    @current_user.tests.where(category_id: category_id).count == 1 &&
    @test_passage.test.category_id == category_id && @test_passage.successful
  end

  def rule_three_last_successful?(bage)
    last_date = ReceivedBage.where(user: @current_user, bage: bage).order(created_at: :desc).pluck(:created_at).first ||
    @current_user.test_passages.order(created_at: :asc).pluck(:created_at).first
    passed_tests = @current_user.test_passages.where(created_at: last_date.utc..Time.current.utc)
    tests_succesfull = passed_tests.order(created_at: :desc)[0..2].pluck(:successful)
    tests_uniq = passed_tests.order(created_at: :desc)[0..2].pluck(:test_id).uniq
    tests_succesfull.all? && tests_succesfull.size == 3 && tests_uniq.size == 3
  end

  def check_category_and_successful?(category_id)
    category_id != @test_passage.test.category_id  && !@test_passage.successful
  end

end
