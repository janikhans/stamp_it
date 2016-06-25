class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @payouts = @user.payouts.all
    @stamps = @user.stamps.all
  end

end
