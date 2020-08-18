class CreateBlacklists < ActiveRecord::Migration[5.2]
  def change
    create_table :blacklists do |t|
      t.string :reason_for_ban
      t.boolean :lifetime_ban?
      t.integer :date_of_ban
      t.integer :client_id
      t.integer :tattoo_shop_id
    end
  end
end
