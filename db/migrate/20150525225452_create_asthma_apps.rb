class CreateAsthmaApps < ActiveRecord::Migration
  def change
    create_table :asthma_apps do |t|
      t.references :goal_id, index: true, foreign_key: true
      t.integer :rescueInhaler_1
      t.integer :rescueInhaler_2

      t.timestamps null: false
    end
  end
end
