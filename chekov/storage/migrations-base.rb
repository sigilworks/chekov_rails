class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.references :role
      t.references :team
      t.references :permissions
      t.string :username

      t.timestamps
    end
    add_index :users, :role_id
    add_index :users, :team_id
    add_index :users, :permissions_id
  end
end


class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :application
      t.string :build_observed
      t.text :description
      t.integer :bz_id
      t.references :reporter
      t.references :assignee
      t.references :status
      t.references :browser

      t.timestamps
    end
    add_index :tasks, :application_id
    add_index :tasks, :reporter_id
    add_index :tasks, :assignee_id
    add_index :tasks, :status_id
    add_index :tasks, :browser_id
  end
end


class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :task
      t.references :commenter
      t.text :description

      t.timestamps
    end
    add_index :comments, :task_id
    add_index :comments, :commenter_id
  end
end


class CreateBrowsers < ActiveRecord::Migration
  def change
    create_table :browsers do |t|
      t.string :name
      t.string :shortname
    end
  end
end


class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
    end
  end
end


class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
    end
  end
end


class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
    end
  end
end


class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :classname
      t.string :description
    end
  end
end


class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
    end
  end
end
