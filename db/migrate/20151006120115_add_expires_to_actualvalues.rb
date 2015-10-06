class AddExpiresToActualvalues < ActiveRecord::Migration
  def change
    add_column :pamer_actualvalues, :expires, :datetime
  end
end
