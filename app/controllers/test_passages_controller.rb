class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call
    if service.success?
      flash[:notice] = "#{t('.success')} #{view_context.link_to('Перейти', result.git_pull_url, target: :_blank)}."
      Gist.create(user: @test_passage.user, question: @test_passage.current_question, url: result.git_pull_url)
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end


end
