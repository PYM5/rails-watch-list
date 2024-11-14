class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @bookmarks = @list.bookmarks.includes(:movie)
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = 'List created successfully.'
      redirect_to list_path(@list)
    else
      flash[:alert] = 'Failed to create the list.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @list.destroy
      flash[:notice] = 'List deleted successfully.'
      redirect_to lists_path
    else
      flash[:alert] = 'Failed to delete the list.'
      redirect_to list_path(@list)
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
