class BookmarksController < ApplicationController
  before_action :set_lists, only: [:create]

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @list = List.find(params[:list_id])
    # @bookmark.list = @list
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path(@list)
  end

  private

  def set_lists
   @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end