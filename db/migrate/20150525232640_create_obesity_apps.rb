class CreateObesityApps < ActiveRecord::Migration
  def change
    create_table :obesity_apps do |t|
      t.references :goal, index: true, foreign_key: true
      t.integer :weight_1
      t.integer :weight_2

      t.timestamps null: false
    end
  end
end
