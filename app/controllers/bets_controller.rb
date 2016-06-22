class BetsController < ApplicationController
  before_action :set_stamp, except: [:index]

  def index
    @bets = Bet.all
  end

  def edit
    @bet = @stamp.bets.find(params[:id])
  end

  def create
    @bet = @stamp.bets.build(bet_params)
    @bet.user = current_user

    if @bet.save
      redirect_to @stamp, notice: 'Bet was successfully created.'
    else
      render :new
    end
  end

  def update
    @bet = @stamp.bets.find(params[:id])
    if @bet.update(bet_params)
      redirect_to @stamp, notice: 'Bet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bet = @stamp.bets.find(params[:id])
    if @bet.destroy
      redirect_to stamp_path(@stamp), notice: 'Bet was successfully destroyed.'
    end
  end

  private
    def set_stamp
      @stamp = Stamp.find(params[:stamp_id])
    end

    def bet_params
      params.require(:bet).permit(:user_id, :stamp_id, :outcome, :wager)
    end
end
