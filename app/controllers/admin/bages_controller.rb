class Admin::BagesController < Admin::BaseController

  before_action :set_bage, only: [:show, :edit, :update, :destroy]

  def index
    @bages = Bage.all
  end

  def new
    @bage = Bage.new
  end

  def create
    @bage = Bage.new(bage_params)
    @bage.save
  end

  def edit;  end

  def show; end

  def update
    if @bage.update(bage_params)
      redirect_to [:admin, @bage]
    else
      render :edit
    end
  end

  def destroy
    @bage.destroy
    redirect_to admin_bages_path
  end

  private

  def set_bage
    @bage = Bage.find(params[:id])
  end

  def bage_params
    params.require(:bage).permit(:title, :image)
  end

end
