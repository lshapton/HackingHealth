class AddGoalRefToAsthmaApp < ActiveRecord::Migration
  def change
    add_reference :asthma_apps, :goal, index: true, foreign_key: true
  end
end
