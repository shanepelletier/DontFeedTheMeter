class MaidsController < ApplicationController
  def index
    @maids = Maid.all
    js :maids => @maids
  end

  def new
    @maid = Maid.new
  end

  def create
    @maid = Maid.new(maid_params)
    @maid.save
    redirect_to :action => "index"
  end

  def show
    @maid = Maid.find(params[:id])
  end

  def edit
    @maid = Maid.find(params[:id])
    js :maid => @maid
  end

  def update
    @maid = Maid.find(params[:id])

    if @maid.update(params[:maid].permit(:lat, :lng))
      redirect_to :action => "index"
    else
      render 'edit'
    end
  end

  private
    def maid_params
      params.require(:maid).permit(:lat, :lng)
    end
end
