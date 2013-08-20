module Enumable
  extend ActiveSupport::Concern
  include Comparable

  included do
    if AppConfig.enumables.constantize?
      # get class name that this is being mixed into...
      CLASS_NAME = name.constantize
      # imitate dynamic assignment of constants on eigenclass
      # using `method_missing`
      class << self

        def method_missing(method, *args, &block)
          # binding.pry
          method_name = method.to_s.upcase
          if method_name.in? CLASS_NAME.pluck(:name)
            define_singleton_method(method_name.to_sym) { CLASS_NAME.where(:name => method_name).first.id }
          else
            super
          end
        end

      end
    end # /if

    def <=>(other)
      klass = self.class.name.constantize
      if other.is_a? klass
        id <=> other.id
      end
    end

  end

end