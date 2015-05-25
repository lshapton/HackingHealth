class AddObesityStatsToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :obesity_pounds, :boolean
  end
end
