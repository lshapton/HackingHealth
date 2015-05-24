class AddPatientToUser < ActiveRecord::Migration
  def change
    add_reference :users, :patient, index: true, foreign_key: true
  end
end
