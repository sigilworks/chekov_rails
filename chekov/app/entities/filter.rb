
class Filter
  attr_reader :name, :symbol

  CUSTOM_FILTERS = [ 'mine', 'unassigned' ]

  def initialize(filter_name)
    @name = filter_name.to_s
    @symbol = filter_name.to_sym
  end

  # is/is not one of the real Status objects
  def is_custom?
    self.in? CUSTOM_FILTERS # Status.all.map(&:name)
  end

  class << self

    def custom_filters
      CUSTOM_FILTERS.dup
    end

    def all_filters
      (Status.all.map(&:name) + CUSTOM_FILTERS).map(&:downcase).map do |f|
        Filter.new f
      end
    end
  end # /eigenclass

end
