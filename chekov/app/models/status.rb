class Status < ActiveRecord::Base
  scope :open, -> { where id: 2..3 }
  scope :closed, -> { where id: 1 }
  scope :need_attention, -> { where id: 4..6 }
  scope :active, -> { where.not id: 1 }

  class << self
    # method missing dynamically create constants
    def method_missing(name, *args, &block)
      if name.to_s.in? Status.pluck(:name)
        Status.where(:name => name).first.id
      else
        super(name, *args, &block)
      end
    end

  end

end
