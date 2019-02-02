class BoxesController < ApplicationController
  def show
    @box = Box.find(params[:id])
  end
end
