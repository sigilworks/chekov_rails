class Status < ActiveRecord::Base
	attr_reader :custom

	# custom status types not persisted in db
	def self.custom
		[ "mine" ]
	end
end
