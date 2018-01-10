class ChangeIntegerLimitInProfiles < ActiveRecord::Migration[5.1]
  def change
     change_column :profiles, :phone, :integer, limit: 8
     change_column :profiles, :postal_code, :integer, limit: 8
   end
end
