class BetsController < ApplicationController
  before_action :set_stamp, except: [:index]
  before_action :authenticate_user!

  def index
    @bets = Bet.all
  end

  def new
    @bet = @stamp.bets.build
  end

  def edit
    @bet = @stamp.bets.find(params[:id])
  end

  def create
    @bet = current_user.ledger.bets.build(bet_params)
    @bet.stamp = @stamp

    respond_to do |format|
      if @bet.save
        format.js
      else
        format.js
      end
    end
  end

  def update
    @bet = @stamp.bets.find(params[:id])
    respond_to do |format|
      if @bet.update(bet_edit_params)
        format.js
      else
        format.js
      end
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
      params.require(:bet).permit(:outcome, :wager)
    end

    def bet_edit_params
      params.require(:bet).permit(:wager)
    end
end
