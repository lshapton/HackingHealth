class AddPatientToFakeFitbit < ActiveRecord::Migration
  def change
    add_reference :fake_fitbits, :patient, index: true, foreign_key: true
  end
end
