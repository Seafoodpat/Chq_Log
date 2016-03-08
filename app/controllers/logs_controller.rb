class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @logs = Log.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end

  def show
  end

  def new
    @log = current_user.logs.build
    @log.prepared = current_user.name
  end

  def edit
  end

  def create
    @log = current_user.logs.build(log_params)
    @log.prepared = current_user.name

    respond_to do |format|
      if @log.save
        format.html { redirect_to @log, notice: 'Record was successfully created.' }
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
        format.html { redirect_to @log, notice: 'Record was successfully updated.' }
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
      format.html { redirect_to logs_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_log
      @log = Log.find(params[:id])
    end

    def log_params
      params.require(:log).permit(:chq_number, :chq_date, :payee_name, :category, :deal_id, :particular, :prepared, :currencies, :amount, :sign_date, :present_date, :status, :salesperson, :voucher_no)
    end
end
