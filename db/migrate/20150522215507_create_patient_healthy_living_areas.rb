class CreatePatientHealthyLivingAreas < ActiveRecord::Migration
  def change
    create_table :patient_healthy_living_areas do |t|
      t.references :healthy_living_area, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
