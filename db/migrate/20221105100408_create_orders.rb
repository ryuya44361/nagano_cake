class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postage, null: false
      t.integer :billing, null: false
      t.integer :billing_Method, null: false
      t.integer :notes_status, null: false
      t.timestamps
    end
  end
end
