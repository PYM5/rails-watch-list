class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy, :edit, :update]

  def index
    @lists = List.all
  end

  def new
    @form_title = "Create a new list"
    @form_subtitle = "for your favorite movies"
    @vlabel = "Add"
    @clabel = "Cancel"
    @cpath = lists_path
    @list = List.new
  end

  def show
    @form_title = "View a list"
    @form_subtitle = "of your favorite movies"
    @clabel = "Cancel"
    @cpath = lists_path
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = 'Success'
      redirect_to lists_path
    else
      @lists = List.all
      flash.now[:alert] = "Failed".capitalize
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @form_title = "Modify your list"
    @form_subtitle = "of your favorite movies"
    @vlabel = "Modify"
    @clabel = "Cancel"
    @cpath = lists_path
  end

  def update
    if @list.update(list_params)
      flash[:notice] = 'Success'
      redirect_to list_path(@list)
    else
      flash[:alert] = 'Failed'
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
