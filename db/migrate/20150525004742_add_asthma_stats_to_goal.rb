class AddAsthmaStatsToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :asthma_rescueInhaler, :boolean
  end
end
