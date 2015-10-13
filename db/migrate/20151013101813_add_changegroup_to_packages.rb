class AddChangegroupToPackages < ActiveRecord::Migration
  def change
    add_column :pamer_packages, :changegroup, :string
  end
end
