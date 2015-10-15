class ChangePackagesExpiresToInteger < ActiveRecord::Migration
  def change
    add_column :pamer_packages, :expires_time, :integer
    add_column :pamer_packages, :expires_unit, :string
    remove_column :pamer_packages, :expires, type: :datetime
  end
end
