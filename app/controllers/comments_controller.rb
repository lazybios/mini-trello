class CommentsController < ApplicationController
  before_action: :require_user

  def index
    card = Card.find(params[:card_id])
    @comments = card.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.card_id = params[:card_id]
    track_activity @comment
    if @comment.save
      respond_to do |format|
        format.html { redirect_to card_comments_path(card_id: params[:card_id]), success: '添加成功' }
        format.js
      end
    else
      redirect_to card_comments_path(card_id: params[:card_id]), success: '添加失败'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    track_activity @comment
    @comment.update_attribute(:is_delete, true)
    respond_to do |format|
      format.html { redirect_to @comment.card }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
