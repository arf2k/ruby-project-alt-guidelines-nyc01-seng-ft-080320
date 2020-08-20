class ChangeColumnsTattooShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :tattoo_shops, :average_review, :float
    remove_column :tattoo_shops, :recommended?, :boolean
    remove_column :tattoo_shops, :does_piercings?, :boolean
  end
end
