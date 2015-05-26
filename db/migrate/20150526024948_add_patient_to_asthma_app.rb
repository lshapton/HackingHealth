class AddPatientToAsthmaApp < ActiveRecord::Migration
  def change
    add_reference :asthma_apps, :patient, index: true, foreign_key: true
  end
end
