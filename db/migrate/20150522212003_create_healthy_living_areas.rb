class CreateHealthyLivingAreas < ActiveRecord::Migration
  def change
    create_table :healthy_living_areas do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
