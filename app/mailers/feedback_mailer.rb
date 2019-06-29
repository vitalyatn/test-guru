class FeedbackMailer < ApplicationMailer

  before_action { @mailer = params[:email] }
  default to: 'supervitas28@gmail.com'

  def send_feedback(feedback)
    @body = feedback.body
    mail from: @mailer
  end

end
