class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.date :birth
      t.integer :phone
      t.string :address
      t.integer :postal_code

      t.timestamps
    end
  end
end
