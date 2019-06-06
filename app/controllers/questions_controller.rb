class QuestionsController < ApplicationController

  before_action :set_test, only: [:new, :create, :index]
  before_action :set_question, only: [:show, :destroy, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit; end

  def update
      if @question.update(question_params)
        redirect_to @question
      else
        render :edit
      end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private
  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question wasn't found"
  end
end
