module Enumable
  extend ActiveSupport::Concern
  include Comparable

  included do
    if AppConfig.enumables.constantize?
      # imitate dynamic assignment of constants on eigenclass
      def self.load_enumables!
        self.pluck(:name, :id).each do |name, id|
          define_singleton_method(name.to_sym) { id }
        end
      end
      # call immediately
      load_enumables!

    end # /if

    def <=>(other)
      klass = self.class.name.constantize
      if other.is_a? klass
        id <=> other.id
      end
    end

  end

end