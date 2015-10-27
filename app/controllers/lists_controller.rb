class ListsController < ApplicationController

  before_action :set_board, only: [:new, :create, :index, :destroy, :edit, :update]

  def index
    @lists = @board.lists.where(is_delete: false)
    @list = List.new
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list =  List.new(list_params)
    @list.board_id = @board.id
    if @list.save
      track_activity @list
      respond_to do |format|
        format.html { redirect_to :board_lists, success: "创建成功" }
        format.js
      end
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
      track_activity @list
      flash[:success] = "更新成功"
      redirect_to :board_lists
    else
      flash[:fail] = "更新失败"
      render :eidt
    end
  end

  def destroy
    @list = List.find_by_id(params[:id])
    @list.update_attribute(:is_delete, true)
    track_activity @list
    respond_to do |format|
      format.html { redirect_to :board_lists }
      format.js
    end
  end

  private
  def set_board
    @board = Board.find_by_id(params[:board_id])
  end

  def list_params
    params.require(:list).permit(:title, :position)
  end

end
