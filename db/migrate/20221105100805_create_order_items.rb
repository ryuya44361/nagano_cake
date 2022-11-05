class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|

      t.integer :item_id, null: false
      t.integer :oeder_id, null: false
      t.integer :purchase_amount, null: false
      t.integer :amount, null: false
      t.integer :create_status, null: false
      t.timestamps
    end
  end
end
