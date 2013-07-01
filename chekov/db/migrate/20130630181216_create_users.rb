class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.references :role
      t.references :team
      t.references :permission
      t.string :username

      t.timestamps
    end
    add_index :users, :role_id
    add_index :users, :team_id
    add_index :users, :permission_id
  end
end
