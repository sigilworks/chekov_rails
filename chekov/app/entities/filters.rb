
class Filters
	extend Enumerable
	# TODO: delegate everything to the @filters array...
	# TODO: move Status.custom to this class instead
	def initialize
		@filters = (Status.all.map(&:name) + Status.custom).map(&:downcase).map do |f|
			Filter.new f
		end
	end

end

class Filter < Struct.new(:symbol, :name)
	
	def initialize(filter_name)
		@name = filter_name
		@symbol = filter_name.to_sym
	end

	def is_custom?
		# is/is not one of the real Status objects
	end

end