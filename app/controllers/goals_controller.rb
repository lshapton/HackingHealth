class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :set_patient
  before_action :set_parents

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goals = Goal.all
    @fitbit = FakeFitbit.where(patient_id: @patient.id)
    @asthma_app = AsthmaApp.where(patient_id: @patient.id)
    @obesity_app = ObesityApp.where(patient_id: @patient.id)
    @diabetes_app = DiabetesApp.where(patient_id: @patient.id)
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to patient_path(@patient), notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: patient_goals_path(@patient)}
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to patient_path(@patient), notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: patient_goals_path(@patient, @goal)}
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to patient_path(@patient), notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:patient_id])
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

    def set_goal
      @goal = Goal.find(params[:id])
    end

    def set_parents
      @medical_conditions = MedicalCondition.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:description, :question_1, :question_2, :question_3, :question_4, :patient_id, :fitbit_steps, :fitbit_activeScore, :medical_condition_id, :start_date, :end_date, :fitbit_lightlyActiveMinutes, :fitbit_fairlyActiveMinutes, :fitbit_veryActiveMinutes, :asthma_rescueInhaler, :obesity_pounds, :diabetes_glucose)
    end
end
