class AddSmokerToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :smoker, :boolean
    add_column :patients, :smoking_years, :integer
  end
end
