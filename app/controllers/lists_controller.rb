class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(set_list)
    @list.save
    redirect_to lists_path
  end

  private

  def set_list
    params.require(:list).permit(:name, :photo)
  end
end
