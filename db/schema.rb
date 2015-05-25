# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150525012226) do

  create_table "comments", force: :cascade do |t|
    t.integer  "healthcare_professional_id"
    t.text     "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "goal_id"
  end

  add_index "comments", ["goal_id"], name: "index_comments_on_goal_id"
  add_index "comments", ["healthcare_professional_id"], name: "index_comments_on_healthcare_professional_id"

  create_table "devices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diabetes_apps", force: :cascade do |t|
    t.integer  "glucose_1"
    t.integer  "glucose_2"
    t.integer  "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "diabetes_apps", ["goal_id"], name: "index_diabetes_apps_on_goal_id"

  create_table "fake_fitbits", force: :cascade do |t|
    t.integer  "steps_1"
    t.integer  "steps_2"
    t.integer  "fairlyActiveMinutes_1"
    t.integer  "fairlyActiveMinutes_2"
    t.integer  "lightlyActiveMinutes_1"
    t.integer  "lightlyActiveMinute_2"
    t.integer  "veryActiveMinute_1"
    t.integer  "veryActiveMinute_2"
    t.integer  "goal_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "fake_fitbits", ["goal_id"], name: "index_fake_fitbits_on_goal_id"

  create_table "goals", force: :cascade do |t|
    t.text     "description"
    t.text     "question_1"
    t.text     "question_2"
    t.text     "question_3"
    t.text     "question_4"
    t.integer  "patient_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "fitbit_steps"
    t.boolean  "fitbit_activeScore"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "medical_condition_id"
    t.boolean  "asthma_rescueInhaler"
    t.boolean  "obesity_pounds"
    t.boolean  "diabetes_glucose"
    t.boolean  "fitbit_fairlyActiveMinutes"
    t.boolean  "fitbit_lightlyActiveMinutes"
    t.boolean  "fitbit_veryActiveMinutes"
  end

  add_index "goals", ["medical_condition_id"], name: "index_goals_on_medical_condition_id"
  add_index "goals", ["patient_id"], name: "index_goals_on_patient_id"

  create_table "healthcare_professionals", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "healthy_living_areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_conditions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_healthy_living_areas", force: :cascade do |t|
    t.integer  "healthy_living_area_id"
    t.integer  "patient_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "patient_healthy_living_areas", ["healthy_living_area_id"], name: "index_patient_healthy_living_areas_on_healthy_living_area_id"
  add_index "patient_healthy_living_areas", ["patient_id"], name: "index_patient_healthy_living_areas_on_patient_id"

  create_table "patient_medical_conditions", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "medical_condition_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "patient_medical_conditions", ["medical_condition_id"], name: "index_patient_medical_conditions_on_medical_condition_id"
  add_index "patient_medical_conditions", ["patient_id"], name: "index_patient_medical_conditions_on_patient_id"

  create_table "patients", force: :cascade do |t|
    t.string   "given_name"
    t.string   "preferred_name"
    t.string   "surname"
    t.date     "dob"
    t.integer  "health_care_number"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "fitbit_oauth_token"
    t.string   "fitbit_oauth_secret"
    t.string   "fitbit_user_id"
    t.string   "address"
    t.string   "cell_phone"
    t.string   "other_medical_conditions"
    t.boolean  "smoker"
    t.integer  "smoking_years"
    t.integer  "cigarettes_per_day"
    t.integer  "user_id"
  end

  add_index "patients", ["user_id"], name: "index_patients_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patient_id"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["patient_id"], name: "index_users_on_patient_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
