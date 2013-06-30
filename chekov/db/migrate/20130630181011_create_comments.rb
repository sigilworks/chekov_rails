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
