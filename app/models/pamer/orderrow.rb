module Pamer
  class Orderrow < ActiveRecord::Base
    belongs_to :orderable, polymorphic: true

    after_save :create_actualvalues

    has_many :actualvalues, dependent: :destroy

    validates :orderable_type, inclusion: {
      in: %w(Pamer::Package Pamer::ItemsPackage)
    }

    # delegate :name, to: :item
    def global_orderable
      self.orderable.to_global_id if self.orderable.present?
    end

    def global_orderable=(orderable)
      self.orderable = GlobalID::Locator.locate orderable
    end

    def create_actualvalues
      orderable.create_actualvalues(self) if orderable.class.method_defined?(:create_actualvalues)
    end
  end
end
