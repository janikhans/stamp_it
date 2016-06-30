class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    if params[:sort_param].nil?
      @stamps = Stamp.includes(:user, :bets).page(params[:page])
    else
      if params[:sort_param] === "ongoing"
        @stamps = Stamp.ongoing.includes(:user, :bets).page(params[:page])
      elsif params[:sort_param] === "completed"
        @stamps = Stamp.completed.includes(:user, :bets).page(params[:page])
      elsif params[:sort_param] === "ending_soon"
        @stamps = Stamp.ending_first.includes(:user, :bets).page(params[:page])
      else
        @stamps = Stamp.includes(:user, :bets).page(params[:page])
      end
    end
  end

end
