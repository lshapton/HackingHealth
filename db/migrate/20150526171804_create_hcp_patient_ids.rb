class CreateHcpPatientIds < ActiveRecord::Migration
  def change
    create_table :hcp_patient_ids do |t|
      t.string :unique_id
      t.references :healthcare_professional, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
