class StampsController < ApplicationController
  before_filter :authorize_user, only: [:edit, :update, :destroy, :mark_complete, :mark_complete_true, :mark_complete_false ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_stamp, only: [:show, :edit, :update, :destroy, :mark_complete, :mark_complete_true, :mark_complete_false]

  # GET /stamps
  # GET /stamps.json
  def index
    @stamps = Stamp.all
  end

  # GET /stamps/1
  # GET /stamps/1.json
  def show
    @bets = @stamp.bets.all
    @bet = @stamp.bets.build
  end

  # GET /stamps/new
  def new
    @stamp = Stamp.new
  end

  # GET /stamps/1/edit
  def edit
  end

  # POST /stamps
  # POST /stamps.json
  def create
    @stamp = current_user.stamps.build(new_stamp_params)

    respond_to do |format|
      if @stamp.save
        format.html { redirect_to @stamp, notice: 'Stamp was successfully created.' }
        format.json { render :show, status: :created, location: @stamp }
      else
        format.html { render :new }
        format.json { render json: @stamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stamps/1
  # PATCH/PUT /stamps/1.json
  def update
    respond_to do |format|
      if @stamp.update(edit_stamp_params)
        format.html { redirect_to @stamp, notice: 'Stamp was successfully updated.' }
        format.json { render :show, status: :ok, location: @stamp }
      else
        format.html { render :edit }
        format.json { render json: @stamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stamps/1
  # DELETE /stamps/1.json
  def destroy
    @stamp.destroy
    respond_to do |format|
      format.html { redirect_to stamps_url, notice: 'Stamp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_complete
  end

  def mark_complete_true
    if @stamp.mark_complete!(true, current_user)
      redirect_to :back, notice: "Winnings have been distributed"
    else
      redirect_to :back, alert: "#{@stamp.errors.full_messages.join(', ')}"
    end
  end

  def mark_complete_false
    if @stamp.mark_complete!(false, current_user)
      redirect_to :back, notice: "Winnings have been distributed"
    else
      redirect_to :back, alert: "#{@stamp.errors.full_messages.join(', ')}"
    end
  end

  private

    def authorize_user
      unless current_user == Stamp.find(params[:id]).user
        render js: "alert('You don't have permission to do that');"
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_stamp
      @stamp = Stamp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_stamp_params
      params.require(:stamp).permit(:speaker, :spoken_date, :completion_date, :proof, :quote)
    end
end
