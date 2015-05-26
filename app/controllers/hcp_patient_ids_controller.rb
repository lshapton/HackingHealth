class HcpPatientIdController < ApplicationController
  before_action :set_healthcare_professional, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show
  end


  def new
  end

  def edit
  end

  def create
    @hcp_patient_id = HcpPatientId.new(hcp_patient_id_params)

    respond_to do |format|
      if @hcp_patient_id.save
        format.html { redirect_to @healthcare_professional, notice: 'Healthcare professional was successfully created.' }
        format.json { render :show, status: :created, location: @healthcare_professional }
      else
        format.html { render :new }
        format.json { render json: @healthcare_professional.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @hcp_patient_id.update(hcp_patient_id_params)
        format.html { redirect_to @healthcare_professional, notice: 'Healthcare professional was successfully updated.' }
        format.json { render :show, status: :ok, location: @healthcare_professional }
      else
        format.html { render :edit }
        format.json { render json: @healthcare_professional.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hcp_patient_id.destroy
    respond_to do |format|
      format.html { redirect_to healthcare_professionals_url, notice: 'Healthcare professional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_healthcare_professional
      @healthcare_professional = HealthcareProfessional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hcp_patient_id_params
      params.require(:hcp_patient_id).permit(:unique_id, :health_care_professional_id)
    end
end