class ListsController < ApplicationController
  def index
    @lists = List.all
  end

# app/controllers/lists_controller.rb
def show
  @list = List.find(params[:id])
  # Récupère tous les bookmarks associés à la liste
  @bookmarks = @list.bookmarks.includes(:movie)
end


  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
