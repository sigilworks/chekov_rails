class Status < ActiveRecord::Base
  include Enumable

  scope :open, -> { where id: [ 2, 3 ] }
  scope :closed, -> { where id: 1 }
  scope :need_attention, -> { where id: [ 4, 5, 6 ] }
  scope :active, -> { where.not id: 1 }

  validates :name, :presence => true, :uniqueness => true, :on => :create
  validates :shortname, :presence => true, :uniqueness => true, :on => :create
end
