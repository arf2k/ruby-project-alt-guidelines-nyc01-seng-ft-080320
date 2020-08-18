class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :date 
      t.string :time 
      t.string :description
      t.integer :artist_id 
      t.integer :tattoo_shop_id 
      t.integer :client_id 
    end
  end
end

