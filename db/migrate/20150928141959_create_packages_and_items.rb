class CreatePackagesAndItems < ActiveRecord::Migration
  def change
    create_table :pamer_packages do |t|
      t.string :name
      t.boolean :repeatable
      t.datetime :expires
      t.text :description
      t.timestamps null: false
    end

    create_table :pamer_items_packages do |t|
      t.integer :package_id
      t.integer :item_id
      t.integer :quantity
      t.boolean :optional, default: true
      t.boolean :repeatable # tud-e ismétlődni?
      t.datetime :expires
      t.timestamps null: false
    end

    create_table :pamer_items do |t|
      t.string :name
      t.text :description
      t.string :code
      t.timestamps null: false
    end

    create_table :pamer_prices do |t|
      t.references :priceable, polymorphic: true, index: true
      t.integer :pricetype # 1.month
      t.money :price
      t.timestamps null: false
    end

    create_table :pamer_orders do |t|
      t.integer :user_id
      t.integer :count
      t.string :state #
      t.datetime :expires # expires + orderable.expires
      t.integer :repeat # Ismétlődik-e? 2.week / 3.month
      ###t.integer :price  Nem itt van
      t.string :currency # EUR
      t.references :orderable, polymorphic: true, index: true
      t.timestamps null: false
    end

    # megrendeléskor jön létre
    create_table :pamer_actualvalues do |t|
      # orderable_id??
      #t.integer :item_package_id
      t.string :code
      t.integer :order_id
      t.integer :value
    end

    add_index :pamer_items, :code
    add_index :pamer_actualvalues, :code
  end
end
