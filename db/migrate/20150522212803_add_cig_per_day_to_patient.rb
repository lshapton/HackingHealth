class AddCigPerDayToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :cigarettes_per_day, :integer
  end
end
