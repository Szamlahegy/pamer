FactoryGirl.define do
  factory 'tarhely_990', class: 'Pamer::Package' do
    name 'Tárhely 990'
    repeatable true
    expires Time.now + 1.year
    description '990 Ft/első év'
    after(:create) do |package|
      # prices
      price = package.prices.build
      price.update(
        pricetype: 'első év',
        price_cents: '99000',
        price_currency: 'HUF'
      )
      # items
      item = FactoryGirl.create('dinamikus_tarhely')
      package.items << item
      itemspackage = package.items_packages.find_by_item_id(item.id)
      itemspackage.update(
        count: 100,
        repeatable: false,
        optional: false
      )
      item = FactoryGirl.create('cpanel_admin')
      package.items << item
      itemspackage = package.items_packages.find_by_item_id(item.id)
      itemspackage.update(
        count: 0,
        repeatable: false,
        optional: false
      )
      item = FactoryGirl.create('addon_domain')
      package.items << item
      itemspackage = package.items_packages.find_by_item_id(item.id)
      itemspackage.update(
        count: 10,
        repeatable: false,
        optional: false
      )
      item = FactoryGirl.create('email_fiok')
      package.items << item
      itemspackage = package.items_packages.find_by_item_id(item.id)
      itemspackage.update(
        count: -1,
        repeatable: false,
        optional: false
      )
      item = FactoryGirl.create('mysql_adatbazis')
      package.items << item
      itemspackage = package.items_packages.find_by_item_id(item.id)
      itemspackage.update(
        count: -1,
        repeatable: false,
        optional: false
      )
    end
  end

  factory 'tarhely_1000', class: 'Pamer::Package' do
    name 'Tárhely 1000'
    repeatable true
    expires Time.now + 1.year
    description '3900 Ft/év'
    after(:create) do |package|
      package.items << FactoryGirl.create('dinamikus_tarhely')
      package.items_packages.count = 1000
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('cpanel_admin')
      package.items_packages.count = 0
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('addon_domain')
      package.items_packages.count = -1
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('email_fiok')
      package.items_packages.count = -1
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('mysql_adatbazis')
      package.items_packages.count = -1
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.save!
    end
  end

  factory 'tarhely_4000', class: 'Pamer::Package' do
    name 'Tárhely 4000'
    repeatable true
    expires Time.now + 1.year
    description '7900 Ft/év'
    after(:create) do |package|
      package.items << FactoryGirl.create('dinamikus_tarhely')
      package.items_packages.count = 4000
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('cpanel_admin')
      package.items_packages.count = 0
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('addon_domain')
      package.items_packages.count = -1
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('email_fiok')
      package.items_packages.count = -1
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('mysql_adatbazis')
      package.items_packages.count = -1
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.save!
    end
  end

  factory 'tarhely_10000', class: 'Pamer::Package' do
    name 'Tárhely 10000'
    repeatable true
    expires Time.now + 1.year
    description '12900 Ft/év'
    after(:commit) do |package|
      package.items << FactoryGirl.create('dinamikus_tarhely')
      package.items_packages.count = 10000
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('cpanel_admin')
      package.items_packages.count = 0
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('addon_domain')
      package.items_packages.count = -1
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('email_fiok')
      package.items_packages.count = -1
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.items << FactoryGirl.create('mysql_adatbazis')
      package.items_packages.count = -1
      package.items_packages.repeatable = false
      package.items_packages.optional = false

      package.save!
    end
  end
end
