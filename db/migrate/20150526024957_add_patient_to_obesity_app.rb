class AddPatientToObesityApp < ActiveRecord::Migration
  def change
    add_reference :obesity_apps, :patient, index: true, foreign_key: true
  end
end
