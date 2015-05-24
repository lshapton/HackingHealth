class CreatePatientMedicalConditions < ActiveRecord::Migration
  def change
    create_table :patient_medical_conditions do |t|
      t.references :patient, index: true, foreign_key: true
      t.references :medical_condition, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
