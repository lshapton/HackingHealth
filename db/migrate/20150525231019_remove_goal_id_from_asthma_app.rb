class RemoveGoalIdFromAsthmaApp < ActiveRecord::Migration
  def change
    remove_reference :asthma_apps, :goal_id, index: true, foreign_key: true
  end
end
