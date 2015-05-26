class CreateAsthmaApps < ActiveRecord::Migration
  def change
    create_table :asthma_apps do |t|
      t.integer :rescueInhaler_1
      t.integer :rescueInhaler_2

      t.timestamps null: false
    end
  end
end
