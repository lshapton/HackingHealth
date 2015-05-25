class CreateFakeFitbits < ActiveRecord::Migration
  def change
    create_table :fake_fitbits do |t|
      t.integer :steps_1
      t.integer :steps_2
      t.integer :fairlyActiveMinutes_1
      t.integer :fairlyActiveMinutes_2
      t.integer :lightlyActiveMinutes_1
      t.integer :lightlyActiveMinute_2
      t.integer :veryActiveMinute_1
      t.integer :veryActiveMinute_2
      t.references :goal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
