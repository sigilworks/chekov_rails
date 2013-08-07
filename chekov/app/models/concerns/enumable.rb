module Enumable
  extend ActiveSupport::Concern

  included do
    # get class name that this is being mixed into...
    CLASS_NAME = name.constantize
    class << self
      # create dynamic assignment of constants on eigenclass
      CLASS_NAME.all.map(&:name).each do |name|
        define_method(name.to_sym) { CLASS_NAME.where(:name => name.to_s.upcase).first.id }
      end
    end
  end
end