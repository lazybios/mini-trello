class CardsController < ApplicationController
  before_action :require_user
  before_action :set_board_and_list, only: [:new, :create, :edit, :update]

  def index
  end

  def show
    @card = Card.where(is_delete: false, id: params[:id]).first
    redirect_to :boards if @card.blank?
  end

  def edit
    @card = Card.find_by_id(params[:id])
  end

  def update
    @card = Card.find_by_id(params[:id])
    if @card.update(card_params)
      track_activity @card
      redirect_to board_lists_path(@board), success: '更新成功'
    else
      render :new, fail: '更新失败'
    end
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.list_id = @list.id
    if @card.save
      track_activity @card
      respond_to do |format|
        format.html { redirect_to board_lists_path(@board), success: '添加成功' }
        format.js
      end
    else
      render :new, fail: '添加失败'
    end
  end

  def destroy
    @card = Card.find_by_id(params[:id])
    @board = @card.list.board
    @card.update_attribute(:is_delete, true)
    track_activity @card
    redirect_to board_lists_path(@board)
  end

  def title
    @card = Card.find(params[:card][:id])
    @card.update_attribute(:title, params[:card][:title])
    render :nothing => true
  end

  def description
    @card = Card.find(params[:card][:id])
    @card.update_attribute(:description, params[:card][:description])
    render :nothing => true
  end

  private

  def set_board_and_list
    @board = Board.find_by_id(params[:board_id])
    @list = List.find_by_id(params[:list_id])
  end

  def card_params
    params.require(:card).permit(:title, :position, :description, :due_date)
  end
end
