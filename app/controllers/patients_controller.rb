class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @goals = @patient.goals
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @medical_conditions = MedicalCondition.all
    @healthy_living_areas = HealthyLivingArea.all
  end

  # GET /patients/1/edit
  def edit
    @medical_conditions = MedicalCondition.all
    @healthy_living_areas = HealthyLivingArea.all
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    current_user.update_attributes(patient_id: @patient.id)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  ## -------- FITBIT API

  def make_fitbit_request
    # The request is made to Fitbit
  end

  def get_fitbit_response
    # Callback from Fitbit Oauth

    # Oauth Access Credentials

    fitbit_oauth_token = params[:oauth_token]
    fitbit_oauth_secret = params[:oauth_verifier]

    # User Information and User Access Credentials
    fitbit_data  = request.env['omniauth.auth']

    # Get User Activity Information
    activities = get_user_activities(fitbit_data)

    #Redirect to Patient Profile
    redirect_to patient_path(current_user.patient_id) 

  end

  def remove_fitbit_link
    #Remove current user's fitbit token/secret in patient model
    @patient = Patient.find(current_user.patient_id)
    @patient.update_attributes(fitbit_oauth_token: nil, fitbit_oauth_secret: nil, fitbit_user_id: nil)

    #Redirect to Patient Profile
    redirect_to patient_path(current_user.patient_id)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
      @goals = @patient.goals

      if @patient.fitbit_oauth_token.present? 
        @patient_fitbit = Fitgem::Client.new({
          consumer_key: ENV['FITBIT_CONSUMER_KEY'],
          consumer_secret: ENV['FITBIT_CONSUMER_SECRET'],
          token: @patient.fitbit_oauth_token,
          secret: @patient.fitbit_oauth_secret,
          user_id: @patient.fitbit_user_id,
        })
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:given_name, :preferred_name, :surname, :dob, :health_care_number, :telephone, :email, :medical_condition_ids, :other_medical_conditions, :smoker, :cigarettes_per_day, :smoking_years, :healthy_living_area_ids)
    end

    def get_user_activities(fitbit_data)
      #Store current user's fitbit token/secret in patient model
      @patient = Patient.find(current_user.patient_id)
      @patient.update_attributes(fitbit_oauth_token: fitbit_data["credentials"]["token"], fitbit_oauth_secret: fitbit_data["credentials"]["secret"], fitbit_user_id: fitbit_data["uid"])

      # Reconnects existing user using the information above
      # access_token = @patient_fitbit.reconnect(@patient.fitbit_oauth_token, @patient.fitbit_oauth_secret)

      # client.activities_on_date('2015-03-25') <- Specific Date
      @patient_fitbit.activities_on_date('today')
    end

end
