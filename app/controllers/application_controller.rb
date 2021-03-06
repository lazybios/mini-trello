class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user || User.find_by_token(session[:token]) if session[:token]
  end

  def require_user
    redirect_to :login if current_user.blank?
  end

  def track_activity(trackable, action = params[:action])
    current_user.activities.create! action: action, trackable: trackable
  end

  def enable_cards(list)
    Card.where(list_id: list.id, is_delete: false).order(position: :asc)
  end

  def enable_comments(card)
    Comment.where(card_id: card.id, is_delete: false)
  end

  helper_method :current_user, :enable_cards, :enable_comments
end
