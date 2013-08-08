class AddNobodyUser < ActiveRecord::Migration
  def change
  	# Add a generic 'nobody' user at id #1, who serves several purposes,
  	# including being the default assignee of new Tasks.
  	User.create(id: 1, first_name: ' ', last_name: ' ', username: 'nobody')
  end
end
