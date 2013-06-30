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
