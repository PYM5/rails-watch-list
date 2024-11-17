class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def new
    @lists = List.all
    @list = List.new
  end

  def show
    @bookmarks = @list.bookmarks.includes(:movie)
  end

  def create
    @list = List.new(list_params)
    # binding.pry
    if @list.save
      @lists = List.all
      redirect_to new_list_path, notice: "List successfully created!"
    else
      @lists = List.all
      flash.now[:alert] = "Failed to create list. Please fix the errors below."
      render :new
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
