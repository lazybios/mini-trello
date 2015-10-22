class ListsController < ApplicationController

  before_action :set_board, only: [:new, :create, :index, :destroy, :edit, :update]

  def index
    @lists = @board.lists
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    if List.create(list_params.merge(board_id: @board.id))
      flash[:success] = "创建成功"
      redirect_to :board_lists
    else
      flash[:fail] = "创建失败"
      render :new
    end
  end

  def edit
    @list = List.find_by_id(params[:id])
  end

  def update
    @list = List.find_by_id(params[:id])
    if @list.update(list_params.merge(board_id: @board.id))
      flash[:success] = "更新成功"
      redirect_to :board_lists
    else
      flash[:fail] = "更新失败"
      render :eidt
    end
  end

  def destroy
    list = List.find_by_id(params[:id])
    list.destroy
    redirect_to :board_lists
  end

  private
  def set_board
    @board = Board.find_by_id(params[:board_id])
  end

  def list_params
    params.require(:list).permit(:title, :position)
  end

end
