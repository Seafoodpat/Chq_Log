class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @logs = Log.all
  end

  def show
  end

  def new
    @log = Log.new
  end

  def edit
  end

  def create
    @log = Log.new(log_params)

    respond_to do |format|
      if @log.save
        format.html { redirect_to @log, notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_log
      @log = Log.find(params[:id])
    end

    def log_params
      params.require(:log).permit(:chq_number, :chq_date, :category, :deal_id, :particular, :currencies, :amount, :prepared, :sign_date, :present_date, :status)
    end
end
