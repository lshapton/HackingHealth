class AddUniqueIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :unique_id, :string
  end
end
