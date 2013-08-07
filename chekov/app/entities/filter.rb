
class Filter
  attr_reader :name, :symbol

  CUSTOM_FILTERS = [ 'mine', 'unassigned', 'active' ]

  def initialize(filter_name)
    @name = filter_name.to_s
    @symbol = filter_name.to_sym
  end

  # is/is not one of the real Status objects
  def is_custom?
    self.in? CUSTOM_FILTERS
  end

  # class methods on Filter's singleton class
  class << self
    def custom_filters
      CUSTOM_FILTERS.dup
    end

    def all_filters
      (Status.all.map(&:shortname) + custom_filters).map(&:downcase) << 'all'
    end
  end

  # add all filters as constant-like names on the singleton class
  self.class.instance_exec self.all_filters do |filters|
    filters.each do |filter|
      define_method(filter.sub(/-/,'_').upcase.to_sym) { filter }
    end
  end

end
