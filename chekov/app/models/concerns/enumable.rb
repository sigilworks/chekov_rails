module Enumable
  extend ActiveSupport::Concern

  included do
    # get class name that this is being mixed into...
    klass = self.name.constantize
    # create dynamic assignment of constants on eigenclass
    klass.all.map(&:name).each do |name|
      define_singleton_method(name.to_sym) { klass.where(:name => name.to_s.upcase).first.id }
    end
  
    def <=>(other)
      klass = self.class.name.constantize
      if other.is_a? klass
        id <=> other.id
      end
    end

  end

end