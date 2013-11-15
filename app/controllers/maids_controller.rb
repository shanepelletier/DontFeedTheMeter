class MaidsController < ApplicationController
  def index
  end

  def new
  end

  def create
    render text: params[:maid].inspect
  end
end
