class AddDiabetesStatsToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :diabetes_glucose, :boolean
  end
end
