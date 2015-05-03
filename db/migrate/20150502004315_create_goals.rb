class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :description
      t.text :question_1
      t.text :question_2
      t.text :question_3
      t.text :question_4
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
