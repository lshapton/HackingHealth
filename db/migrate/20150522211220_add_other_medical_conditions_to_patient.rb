class AddOtherMedicalConditionsToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :other_medical_conditions, :string
  end
end
