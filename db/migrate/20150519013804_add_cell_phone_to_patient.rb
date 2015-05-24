class AddCellPhoneToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :cell_phone, :string
  end
end
