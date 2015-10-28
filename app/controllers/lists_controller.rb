class ListsController < ApplicationController
  before_action :require_user
  before_action :set_board, only: [:new, :create, :index, :destroy, :edit, :update]

  def index
    @lists = @board.lists.where(is_delete: false).order(position: :asc)
    @list = List.new
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.board_id = @board.id
    if not @board.lists.blank?
      @list.position = @board.lists.maximum(:position).next
    end
    if @list.save
      track_activity @list
      respond_to do |format|
        format.html { redirect_to :board_lists, success: '创建成功' }
        format.js
      end
    else
      render :new, fail: '创建失败'
    end
  end

  def edit
    @list = List.find_by_id(params[:id])
  end

  def update
    @list = List.find_by_id(params[:id])
    if @list.update(list_params.merge(board_id: @board.id))
      track_activity @list
      redirect_to :board_lists, success: '更新成功'
    else
      render :eidt, fail: '更新失败'
    end
  end

  def destroy
    @list = List.find_by_id(params[:id])
    @list.update_attribute(:is_delete, true)
    track_activity @list
    respond_to do |format|
      format.html { redirect_to board_lists_path(@list.board) }
      format.js
    end
  end

  def sort
    params[:order].each do |k, v|
      List.find(v[:id]).update_attribute(:position, v[:position])
    end
    render :nothing => true
  end

  private

  def set_board
    @board = Board.find_by_id(params[:board_id])
  end

  def list_params
    params.require(:list).permit(:title, :position)
  end
end
