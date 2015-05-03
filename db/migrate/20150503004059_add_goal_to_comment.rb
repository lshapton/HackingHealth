class AddGoalToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :goal, index: true, foreign_key: true
  end
end
