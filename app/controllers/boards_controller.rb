class BoardsController < ApplicationController
  before_action :require_user
  before_action :set_board, only: [:show, :edit, :destroy, :update]

  def new
    @board = Board.new
  end

  def create
    if Board.create(board_params)
      flash[:success] = "创建成功"
      redirect_to :boards
    else
      flash[:fail] = "创建失败"
      render :new
    end
  end

  def index
    @boards = Board.all
  end

  # def show
  #   @lists = @board.lists
  # end

  def edit
  end

  def update
    if @board.update(board_params)
      flash[:success] = "创建成功"
      redirect_to :boards
    else
      flash[:fail] = "更新失败"
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to :boards
  end

  private

  def set_board
    @board = Board.find_by_id(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :description, :permission)
  end

end
