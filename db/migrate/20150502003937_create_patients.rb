class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :given_name
      t.string :preferred_name
      t.string :surname
      t.date :dob
      t.integer :health_care_number
      t.string :telephone
      t.string :email

      t.timestamps null: false
    end
  end
end
