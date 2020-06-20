# frozen_string_literal: true

class CheckoutRecordsController < ApplicationController
  before_action :set_checkout_record, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:update]

  # GET /checkout_records
  # GET /checkout_records.json
  def index
    @checkout_records = CheckoutRecord.all
  end

  # GET /checkout_records/1
  # GET /checkout_records/1.json
  def show; end

  # GET /checkout_records/new
  def new
    @checkout_record = CheckoutRecord.new
  end

  # GET /checkout_records/1/edit
  def edit; end

  # POST /checkout_records
  # POST /checkout_records.json
  def create
    @checkout_record = CheckoutRecord.set_initial(checkout_record_params)

    respond_to do |format|
      if @checkout_record.save
        format.html { redirect_to books_path(id: checkout_record_params[:book_id]), notice: 'Checkout record was successfully created.' }
        format.json { render :show, status: :created, location: @checkout_record }
      else
        format.html { redirect_to books_path(id: checkout_record_params[:book_id]), notice: 'An error occured.' }
        format.json { render json: @checkout_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkout_records/1
  # PATCH/PUT /checkout_records/1.json
  def update
    respond_to do |format|
      if @checkout_record.set_returned
        format.html { redirect_to '/', notice: 'Checkout record was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkout_record }
      else
        format.html { redirect_to '/', notice: 'Something went wrong.' }
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
    params.require(:checkout_record).permit(:id, :member_id, :book_id)
  end

  def update_params
    params.permit(:data)
  end
end
