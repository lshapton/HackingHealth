class AddFitBitParametersToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :fitbit_steps, :boolean
    add_column :goals, :fitbit_activeScore, :boolean
  end
end
