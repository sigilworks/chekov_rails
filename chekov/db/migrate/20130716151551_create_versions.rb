class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :name
    end
  end
end
