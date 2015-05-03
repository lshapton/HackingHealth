class CreateHealthcareProfessionals < ActiveRecord::Migration
  def change
    create_table :healthcare_professionals do |t|
      t.string :name
      t.string :role

      t.timestamps null: false
    end
  end
end
