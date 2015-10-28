class ActivitiesController < ApplicationController
  before_action :require_user

  def index
    @activities = current_user.activities.order('created_at desc')
  end
end


