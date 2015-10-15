require 'spec_helper'
require 'byebug'

describe "create order" do
  it "from scratch" do
    user = User.new

    tarhely990 = FactoryGirl.create('tarhely_990')
    tarhely1000 = FactoryGirl.build('tarhely_1000')
    tarhely4000 = FactoryGirl.build('tarhely_4000')
    tarhely10000 = FactoryGirl.build('tarhely_10000')
    order = Pamer::Order.new
    order.user_id = user.id
    order.count = 1
    order.state = 'start'
    order.orderable = tarhely990
    order.expires = tarhely990.expires
    # talán Time.now + package.expires(1.year.to_i)

    order.save!
    puts '------- Order -------'
    puts order.inspect
    puts '  ----- Orderable -----'
    puts order.orderable.inspect
    puts order.orderable.prices.inspect
    if order.orderable_type == 'Pamer::Package'
      order.orderable.items_packages.each do |item|
        puts '    ----- Item -----'
        puts item.inspect
      end
    end

    puts 'Usernek van-e érvényes ''dinamikus_tarhely'' csomagja?'
    ###################
    puts Pamer::PamerPolicy.new(user, 'dinamikus_tarhely').valid?
    puts Pamer::PamerPolicy.new(user, 'dinamikus_tarhely').decrement!
    ###################
    puts '---'
    expect(tarhely990.name).to eq("Tárhely 990")
  end
end

# Test user for testing
class User
  attr_reader :id

  def initialize
    @id = 1
  end
end
