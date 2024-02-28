class BankSlipsController < ApplicationController
  before_action :set_bank_slip, only: %i[ show edit update destroy ]

  # GET /bank_slips or /bank_slips.json
  def index
    @bank_slips = BankSlip.all
  end

  # GET /bank_slips/1 or /bank_slips/1.json
  def show
  end

  # GET /bank_slips/new
  def new
    @bank_slip = BankSlip.new
  end

  # GET /bank_slips/1/edit
  def edit
  end

  # POST /bank_slips or /bank_slips.json
  def create
    @bank_slip = BankSlip.new(bank_slip_params)

    if @bank_slip.save
      handle_successful_save
    else
      handle_failed_save
    end
  end

  # PATCH/PUT /bank_slips/1 or /bank_slips/1.json
  def update
    respond_to do |format|
      if @bank_slip.update(bank_slip_params)
        format.html { redirect_to bank_slip_url(@bank_slip), notice: updated_notice }
        format.json { render :show, status: :ok, location: @bank_slip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank_slip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_slips/1 or /bank_slips/1.json
  def destroy
    @bank_slip.destroy!

    respond_to do |format|
      format.html { redirect_to bank_slips_url, notice: destroyed_notice }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_slip
      @bank_slip = BankSlip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_slip_params
      params.require(:bank_slip).permit(:value,
                                        :drawee_address,
                                        :drawee_city,
                                        :drawee_identification_number,
                                        :drawee_name,
                                        :drawee_neighborhood,
                                        :drawee_state,
                                        :drawee_zipcode,
                                        :due_date,
                                        :status)
    end

    def handle_successful_save
      respond_to do |format|
        format.html { redirect_to bank_slip_url(@bank_slip), notice: created_notice }
        format.json { render :show, status: :created, location: @bank_slip }
      end
    end

    def handle_failed_save
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank_slip.errors, status: :unprocessable_entity }
      end
    end

    def created_notice
      I18n.t('activerecord.successful.messages.created', model: @bank_slip.class.model_name.human)
    end

    def updated_notice
      I18n.t('activerecord.successful.messages.updated', model: @bank_slip.class.model_name.human)
    end

    def destroyed_notice
      I18n.t('activerecord.successful.messages.destroyed', model: @bank_slip.class.model_name.human)
    end
end
