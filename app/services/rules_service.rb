class RulesService

  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end

  def give_bage
    bages = []
    bages << Bage.find_by(title: "отлично") if first_attempt?
    bages << Bage.find_by(title: "три подряд успешно пройденных теста") if three_last_successful?
    bages << Bage.find_by(title: "все тесты категории backend") if all_backend?

    # end
  end

  private

  def first_attempt?
    @current_user.test_passages.where(test_id: @test_passage.test).count == 1
  end

  def all_backend?
    backend = Category.find_by(title: "backend")
    list_title = []
    Test.all.where(category: backend).each do |test|
      list_title << test.title
    end
    list_user_title = []
    @current_user.tests.where(category: backend).each do |test|
      list_user_title << test.title
    end
    (list_user_title - list_title).empty?
  end

  def three_last_successful?
   result = true
   tests = @current_user.test_passages.order(created_at: :desc)[0..2]
   tests.each do |test|
     result = result && test.successful?
   end
   result
  end

end
