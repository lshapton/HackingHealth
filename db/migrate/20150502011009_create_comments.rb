class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :healthcare_professional, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
