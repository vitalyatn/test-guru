class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: [:show, :edit, :update, :destroy, :start, :update_inline]

  def index; end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit;  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def create
    @test = current_user.authored_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title,:level,:category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end

end
