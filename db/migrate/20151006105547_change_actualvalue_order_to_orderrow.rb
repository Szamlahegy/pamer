class ChangeActualvalueOrderToOrderrow < ActiveRecord::Migration
  def change
    rename_column :pamer_actualvalues, :order_id, :orderrow_id
  end
end
