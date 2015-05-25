class AddFitbitStatsToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :fitbit_fairlyActiveMinutes, :boolean
    add_column :goals, :fitbit_lightlyActiveMinutes, :boolean
    add_column :goals, :fitbit_veryActiveMinutes, :boolean
  end
end
