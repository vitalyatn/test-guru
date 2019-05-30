class QuestionsController < ApplicationController

  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: {questions: Question.all}
  end

  def show
     @question = Question.find_by(id: params[:id])
     render inline: '<strong>Вопрос:</strong> <%= @test.body %>'
  end

  def new

  end

  def create
    result = ["Class: #{params.class}", "Parametrs: #{params.inspect}"]
    render plain: result.join("\n")
  end

  def destroy
    Question.find_by(id: params[:id]).destroy
  end

  private
  def find_test
    @test = Question.find_by(test_id: params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Question wasn't found"
  end
end
