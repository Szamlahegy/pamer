class AddDescriptionToActualvalues < ActiveRecord::Migration
  def change
    add_column :pamer_actualvalues, :description, :string
  end
end
