class RemoveOrderFields < ActiveRecord::Migration
  def change
    remove_column :pamer_orders, :count, type: :integer
    remove_column :pamer_orders, :state, type: :string
    remove_column :pamer_orders, :expires, type: :datetime
    remove_column :pamer_orders, :repeat, type: :integer
    remove_column :pamer_orders, :currency, type: :string
    remove_column :pamer_orders, :orderable_id, type: :integer
    remove_column :pamer_orders, :orderable_type, type: :string
  end
end
