class AddCategoryToGoal < ActiveRecord::Migration
  def change
    add_reference :goals, :medical_condition, index: true, foreign_key: true
  end
end
