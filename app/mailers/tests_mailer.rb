class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    if test_passage.successful?
      @user = test_passage.user
      @test = test_passage.test

      mail to: @user.email
    end
  end
end
