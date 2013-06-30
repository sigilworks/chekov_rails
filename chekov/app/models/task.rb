class Task < ActiveRecord::Base
  belongs_to :application
  belongs_to :reporter
  belongs_to :assignee
  belongs_to :status
  belongs_to :browser
end
