class HealthcareProfessionalsController < ApplicationController
  before_action :set_healthcare_professional, only: [:show, :edit, :update, :destroy]

  # GET /healthcare_professionals
  # GET /healthcare_professionals.json
  def index
    @healthcare_professionals = HealthcareProfessional.all
  end

  # GET /healthcare_professionals/1
  # GET /healthcare_professionals/1.json
  def show
  end

  # GET /healthcare_professionals/new
  def new
    @healthcare_professional = HealthcareProfessional.new
  end

  # GET /healthcare_professionals/1/edit
  def edit
  end

  # POST /healthcare_professionals
  # POST /healthcare_professionals.json
  def create
    @healthcare_professional = HealthcareProfessional.new(healthcare_professional_params)

    respond_to do |format|
      if @healthcare_professional.save
        format.html { redirect_to @healthcare_professional, notice: 'Healthcare professional was successfully created.' }
        format.json { render :show, status: :created, location: @healthcare_professional }
      else
        format.html { render :new }
        format.json { render json: @healthcare_professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /healthcare_professionals/1
  # PATCH/PUT /healthcare_professionals/1.json
  def update
    respond_to do |format|
      if @healthcare_professional.update(healthcare_professional_params)
        format.html { redirect_to @healthcare_professional, notice: 'Healthcare professional was successfully updated.' }
        format.json { render :show, status: :ok, location: @healthcare_professional }
      else
        format.html { render :edit }
        format.json { render json: @healthcare_professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /healthcare_professionals/1
  # DELETE /healthcare_professionals/1.json
  def destroy
    @healthcare_professional.destroy
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
    def healthcare_professional_params
      params.require(:healthcare_professional).permit(:name, :role)
    end
end
