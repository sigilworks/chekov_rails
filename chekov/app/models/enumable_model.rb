class EnumableModel < ActiveRecord::Base
  include Comparable

  self.abstract_class = true

  def self.inherited(child_class)
    # call immediately
    load_enumables!(child_class)
    super
  end

  # imitate dynamic assignment of constants on eigenclass
  def self.load_enumables!(klass)
    if AppConfig.enumables.constantize?
      klass.pluck(:name, :id).each do |name, id|
        define_singleton_method(name.to_sym) { id }
        # klass.const_set(name.upcase.to_sym, id)
      end
    end
  end

  def <=>(other)
    klass = self.class.name.constantize
    if other.is_a? klass
      id <=> other.id
    end
  end

end