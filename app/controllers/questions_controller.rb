class QuestionsController < ApplicationController

  before_action :find_test, only: [:new, :create]
  before_action :find_question, only: [:show, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: {questions: Question.all}
  end

  def show
     render inline: '<strong>Вопрос:</strong> <%= @question.body %>'
  end

  def new; end

  def create
    @question = @test.questions.create(question_params)
  end

  def destroy
    @question.destroy
  end

  private
  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question wasn't found"
  end
end
