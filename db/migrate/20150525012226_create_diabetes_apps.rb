class CreateDiabetesApps < ActiveRecord::Migration
  def change
    create_table :diabetes_apps do |t|
      t.integer :glucose_1
      t.integer :glucose_2
      t.references :goal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
