class FeedbackMailer < ApplicationMailer

  before_action { @mailer = params[:email] }

  default from: @mailer

  def send_feedback(feedback)
    @user = 'supervitas28@gmail.com'
    @body = feedback.body
    mail to: @user
  end

end
