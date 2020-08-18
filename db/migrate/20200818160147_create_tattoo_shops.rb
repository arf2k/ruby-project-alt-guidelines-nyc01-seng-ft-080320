class CreateTattooShops < ActiveRecord::Migration[5.2]
  def change
    create_table :tattoo_shops do |t|
      t.string :name
      t.string :location
      t.float :average_review
      t.string :ambiance
      t.string :operational_hours
      t.boolean :does_piercings?
      t.boolean :recommended?
    end
  end
end
