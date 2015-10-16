class AddTrackingidToOrder < ActiveRecord::Migration
  def change
    add_column :pamer_orders, :trackingid, :string
  end
end
