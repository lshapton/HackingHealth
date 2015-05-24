class AddFitBitUserIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :fitbit_user_id, :string
  end
end
