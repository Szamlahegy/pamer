FactoryGirl.define do
  factory 'dinamikus_tarhely', class: 'Pamer::Item' do
    name 'dinamikus tárhely'
    description ''
    code 'dinamikus_tarhely'
    # after(:create) do |item|
    #   price = item.prices.build
    #   price.update(
    #     pricetype: '1 hónapra',
    #     price_cents: '',
    #     price_currency: 'HUF'
    #   )
    # end
  end
  factory 'cpanel_admin', class: 'Pamer::Item' do
    name 'cPanel admin felület'
    description ''
    code 'cpanel_admin'
  end
  factory 'addon_domain', class: 'Pamer::Item' do
    name 'addon domain'
    description ''
    code 'addon_domain'
  end
  factory 'email_fiok', class: 'Pamer::Item' do
    name 'e-mail fiók'
    description ''
    code 'email_fiok'
  end
  factory 'mysql_adatbazis', class: 'Pamer::Item' do
    name 'MySQL adatbázis'
    description ''
    code 'mysql_adatbazis'
  end
end
