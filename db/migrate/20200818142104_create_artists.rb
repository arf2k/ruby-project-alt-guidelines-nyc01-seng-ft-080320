class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name 
      t.string :style 
      t.boolean :does_piercings?
      t.integer :tattoo_shop_id  
    end
  end
end

