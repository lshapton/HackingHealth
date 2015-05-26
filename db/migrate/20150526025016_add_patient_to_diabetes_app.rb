class AddPatientToDiabetesApp < ActiveRecord::Migration
  def change
    add_reference :diabetes_apps, :patient, index: true, foreign_key: true
  end
end
