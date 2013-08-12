module Enumable
  extend ActiveSupport::Concern

  # TODO: move this sort of functionality to an
  # initializer instead, based on options switch in chekov.yml
  autoload :Status, "app/models/status"
  autoload :Team, "app/models/team"
  autoload :Role, "app/models/role"
  autoload :Permission, "app/models/permission"

  included do
    if AppConfig.enumables.constantize?
      # get class name that this is being mixed into...
      CLASS_NAME = name.constantize
      # imitate dynamic assignment of constants on eigenclass
      # using `method_missing`
      class << self
        def method_missing(name, *args, &block)
          name = name.to_s.upcase
          if name.in? CLASS_NAME.pluck(:name)
            CLASS_NAME.where(:name => name).first.id
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