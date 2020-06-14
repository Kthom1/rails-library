class CheckoutRecordsController < ApplicationController
  before_action :set_checkout_record, only: [:show, :edit, :update, :destroy]

  # GET /checkout_records
  # GET /checkout_records.json
  def index
    @checkout_records = CheckoutRecord.all
  end

  # GET /checkout_records/1
  # GET /checkout_records/1.json
  def show
  end

  # GET /checkout_records/new
  def new
    @checkout_record = CheckoutRecord.new
  end

  # GET /checkout_records/1/edit
  def edit
  end

  # POST /checkout_records
  # POST /checkout_records.json
  def create
    @checkout_record = CheckoutRecord.new(checkout_record_params)

    respond_to do |format|
      if @checkout_record.save
        format.html { redirect_to @checkout_record, notice: 'Checkout record was successfully created.' }
        format.json { render :show, status: :created, location: @checkout_record }
      else
        format.html { render :new }
        format.json { render json: @checkout_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkout_records/1
  # PATCH/PUT /checkout_records/1.json
  def update
    respond_to do |format|
      if @checkout_record.update(checkout_record_params)
        format.html { redirect_to @checkout_record, notice: 'Checkout record was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkout_record }
      else
        format.html { render :edit }
        format.json { render json: @checkout_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkout_records/1
  # DELETE /checkout_records/1.json
  def destroy
    @checkout_record.destroy
    respond_to do |format|
      format.html { redirect_to checkout_records_url, notice: 'Checkout record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout_record
      @checkout_record = CheckoutRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checkout_record_params
      params.fetch(:checkout_record, {})
    end
end
