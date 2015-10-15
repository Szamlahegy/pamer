module Pamer
  #
  # Every orderrow belongs to an Order
  #
  class Orderrow < ActiveRecord::Base
    belongs_to :orderable, polymorphic: true

    after_create :create_actualvalues

    has_many :actualvalues, dependent: :destroy

    validates :orderable_type, inclusion: {
      in: %w(Pamer::Package Pamer::ItemsPackage)
    }

    def global_orderable
      orderable.to_global_id if orderable.present?
    end

    def global_orderable=(orderable)
      self.orderable = GlobalID::Locator.locate orderable
    end

    def create_actualvalues
      orderable.create_actualvalues(self) if can_create_actualvalues?(orderable)
    end

    private

    def can_create_actualvalues?(orderable)
      orderable.class.method_defined?(:create_actualvalues)
    end
  end
end
