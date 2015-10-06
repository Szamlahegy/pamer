class CreateOrderrows < ActiveRecord::Migration
  def change
    create_table :pamer_orderrows do |t|
      t.integer :order_id
      t.integer :count
      t.string :state
      t.datetime :expires
      t.integer :repeat
      t.string :currency
      t.references :orderable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
