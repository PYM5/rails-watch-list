class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      flash[:notice] = 'Bookmark created successfully.'
      redirect_to list_path(@list)
    else
      flash[:alert] = 'Failed to create the bookmark.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @bookmark.destroy
      flash[:notice] = 'Bookmark deleted successfully.'
    else
      flash[:alert] = 'Failed to delete the bookmark.'
    end
    redirect_to list_path(@bookmark.list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
