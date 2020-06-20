# frozen_string_literal: true

class ReserveRecordsController < ApplicationController
  before_action :set_reserve_record, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:update]

  # GET /reserve_records
  # GET /reserve_records.json
  def index
    @reserve_records = ReserveRecord.all
  end

  # GET /reserve_records/1
  # GET /reserve_records/1.json
  def show; end

  # GET /reserve_records/new
  def new
    @reserve_record = ReserveRecord.new
  end

  # GET /reserve_records/1/edit
  def edit; end

  # POST /reserve_records
  # POST /reserve_records.json
  def create
    @reserve_record = ReserveRecord.set_initial(reserve_record_params)

    respond_to do |format|
      if @reserve_record.save
        format.html { redirect_to books_path(id: reserve_record_params[:book_id]), notice: 'Reserve record was successfully created.' }
        format.json { render :show, status: :created, location: @reserve_record }
      else
        format.html { redirect_to books_path(id: reserve_record_params[:book_id]), notice: 'An error occured.' }
        format.json { render json: @reserve_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserve_records/1
  # PATCH/PUT /reserve_records/1.json
  def update
    respond_to do |format|
      if @reserve_record.cancel_reserve
        format.html { redirect_to '/', notice: 'Reserve record was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserve_record }
      else
        format.html { redirect_to '/', notice: 'Something went wrong.' }
        format.json { render json: @reserve_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserve_records/1
  # DELETE /reserve_records/1.json
  def destroy
    @reserve_record.destroy
    respond_to do |format|
      format.html { redirect_to reserve_records_url, notice: 'Reserve record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reserve_record
    @reserve_record = ReserveRecord.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reserve_record_params
    params.require(:reserve_record).permit(:id, :member_id, :book_id)
  end

  def update_params
    params.permit(:data)
  end
end
