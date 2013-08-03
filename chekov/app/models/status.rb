class Status < ActiveRecord::Base
	scope :open, -> { where id: 2..3 }
	scope :closed, -> { where id: 1 }
	scope :need_attention, -> { where id: 4..6 }
	scope :active, -> { where.not id: 1 }
end
