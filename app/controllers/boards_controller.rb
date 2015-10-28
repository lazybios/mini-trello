class BoardsController < ApplicationController
  before_action :require_user
  before_action :set_board, only: [:show, :edit, :destroy, :update]

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      track_activity @board
      respond_to do |format|
        format.html { redirect_to :boards, success: '创建成功' }
        format.js
      end
    else
      render :new, fail: '创建失败'
    end
  end

  def index
    @boards = Board.where(is_delete: false)
    @boards = current_user.boards.where(is_delete: false)
    @board = Board.new
  end

  def edit
  end

  def update
    if @board.update(board_params)
      track_activity @board
      redirect_to :boards, success: '创建成功'
    else
      render :edit, fail: '更新失败'
    end
  end

  def destroy
    @board.update_attribute(:is_delete, true)
    track_activity @board
    respond_to do |format|
      format.html { redirect_to :boards }
      format.js
    end
  end

  def name
    @board = Board.find(params[:board][:id])
    @board.update_attribute(:name, params[:board][:name])
    render :nothing => true
  end

  private

  def set_board
    @board = Board.find_by_id(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :description, :permission)
  end
end
