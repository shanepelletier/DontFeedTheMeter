class MaidsController < ApplicationController
  def index
    @maids = Maid.all
    js :maids => @maids
  end

  def new
  end

  def create
    @maid = Maid.new(maid_params)
    @maid.save
    redirect_to :action => "index"
  end

  def show
    @maid = Maid.find(params[:id])
  end

  private
    def maid_params
      params.require(:maid).permit(:lat, :lng)
    end
end
