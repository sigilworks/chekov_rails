
 - Make User<->Role relationship 1:n, instead of 1:1
   new Permissions and Roles:
	Permission:: 'READ_ONLY', 'ADD_ONLY', 'BASIC', 'ADMIN'
	Role:: 'ASSIGNEE', 'COMMENTER', 'REPORTER'

	class Permission < ActiveRecord::Base
	  has_and_belongs_to_many :users
	end

	class User < ActiveRecord::Base
	  has_and_belongs_to_many :roles
	end

	rails g migration create_roles_users_table

	class CreateRolesUsers < ActiveRecord::Migration
	  def change
	    create_table :roles_users, :id => false do |t|
	        t.references :role
	        t.references :user
	    end
	    add_index :roles_users, [:role_id, :user_id]
	    add_index :roles_users, :user_id
	  end

	end


@user.roles >= Role.ADMIN

 - Add creation/updation dates in Task/Comment add/edit popups?

 - TaskPromotionStrategy still needs to have second part implemented:
 	- when Task has Status == NEW,
 	- Assignee changing from Nobody -> one of the User.reals ==> promote!

 - RolePermissionsStrategy implmentation around the .meta options that appear

 - DateTimeFormattingService/-Provider? to hold date/time formatting constants, &c., for uniformity


 - task-stats: express as MetroUI-style, flat/matte-colored heatmap square?

 - make .meta icons darker (maybe opacity: 0.5?)

- YAML site config file
	- include option to pre-load values in Status, Team, Role, Permission so theyre done in initializer?