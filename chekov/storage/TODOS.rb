
 - new Permissions and Roles:
	Permission:: 'READ_ONLY', 'ADD_ONLY', 'BASIC', 'ADMIN' 
	Role:: 'ASSIGNEE', 'REPORTER', 'COMMENTER', 'ALL'

	class Permission < ActiveRecord::Base
	  has_and_belongs_to_many :users
	end
	 
	class User < ActiveRecord::Base
	  has_and_belongs_to_many :roles
	end


	class CreateAssembliesAndParts < ActiveRecord::Migration
	  def change
	    create_table :permissions do |t|
	      t.string :name
	      t.timestamps
	    end
	 
	    create_table :users do |t|
	      t.string :part_number
	      t.timestamps
	    end
	 
	    create_table :permissions_users do |t|
	      t.belongs_to :permission
	      t.belongs_to :user
	    end
	  end
	end



 - TaskPromotionStrategy still needs to have second part implemented:
 	- when Task has Status == NEW,
 	- Assignee changing from Nobody -> one of the User.reals ==> promote!

 - RolePermissionsStrategy implmentation around the .meta options that appear

 - DateTimeFormattingService/-Provider? to hold date/time formatting constants, &c., for uniformity

 - Make User<->Role relationship 1:n, instead of 1:1

 - task-stats: express as MetroUI-style, flat/matte-colored heatmap square?

 - make .meta icons darker (maybe opacity: 0.5?)


To have launchd start redis at login:
    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
Then to load redis now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
Or, if you don't want/need launchctl, you can just run:
    redis-server /usr/local/etc/redis.conf