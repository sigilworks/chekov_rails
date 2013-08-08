module Enumable
  extend ActiveSupport::Concern

  included do
    # get class name that this is being mixed into...
    klass = self.name.constantize
    # create dynamic assignment of constants on eigenclass
    klass.all.map(&:name).each do |name|
      define_singleton_method(name.to_sym) { klass.where(:name => name.to_s.upcase).first.id }
    end

    # TODO:
    # *instead*, let's make one db call at startup, move ids->vals to a hash,
    # then use hash to make the attributes on the class:
    # e.g., Hash[ Status.pluck(:name, :id)  ]
    # => { 'CLOSED' => 1, 'OPEN' => 2, 'NEW' => 3, 'URGENT' => 4, 'REOPENED' => 5, 'AWAITING_FEEBACK' => 6 }, &c.
    # Hash[klass.pluck(:name, :id)].each do |name, id|
    #   define_singleton_method(name.to_sym) { id }
    # end

    def <=>(other)
      klass = self.class.name.constantize
      if other.is_a? klass
        id <=> other.id
      end
    end

  end

end