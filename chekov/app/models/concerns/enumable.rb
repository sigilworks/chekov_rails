module Enumable
  extend ActiveSupport::Concern

  autoload :Status, "app/models/status"
  autoload :Team, "app/models/team"
  autoload :Role, "app/models/role"
  autoload :Permission, "app/models/permission"



  included do
    # get class name that this is being mixed into...
    CLASS_NAME = name.constantize
    # imitate dynamic assignment of constants on eigenclass
    # using `method_missing`
    class << self
      def method_missing(name, *args, &block)
        if name.to_s.in? CLASS_NAME.pluck(:name)
          CLASS_NAME.where(:name => name.to_s).first.id
        else
          super
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

end