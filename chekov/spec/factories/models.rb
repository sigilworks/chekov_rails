# FactoryGirl.define do

#   factory :user, aliases: [ :commenter, :reporter, :assignee ] do
#     id 2
#     first_name "John"
#     last_name  "Doe"
#     username "jdoe"
#     association :team, factory: :team, :id => 4
#     association :role, factory: :role, :id => 2
#     association :permission, factory: :permission, :id => 1
#   end

#   factory :team do
#     id 4
#     name 'MGMT'
#   end

#   factory :role do
#     id 2
#     name 'REPORTER'
#   end

#   factory :permission do
#     id 1
#     name 'ADMIN'
#   end

#   factory :version do
#     id 1
#     name '6.1.4.1'
#   end

# end

  # create_table "applications", force: true do |t|
  #   t.string "name"
  # end

  # create_table "browsers", force: true do |t|
  #   t.string "name"
  #   t.string "shortname"
  # end

  # create_table "comments", force: true do |t|
  #   t.integer  "task_id"
  #   t.integer  "commenter_id"
  #   t.text     "description"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  # add_index "comments", ["commenter_id"], name: "index_comments_on_commenter_id"
  # add_index "comments", ["task_id"], name: "index_comments_on_task_id"

  # create_table "permissions", force: true do |t|
  #   t.string "name"
  # end

  # create_table "roles", force: true do |t|
  #   t.string "name"
  # end

  # create_table "statuses", force: true do |t|
  #   t.string   "name"
  #   t.string   "description"
  #   t.string   "shortname"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  # create_table "tasks", force: true do |t|
  #   t.integer  "application_id"
  #   t.string   "build_observed"
  #   t.text     "description"
  #   t.integer  "bz_id"
  #   t.integer  "reporter_id"
  #   t.integer  "assignee_id"
  #   t.integer  "status_id"
  #   t.integer  "browser_id"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  # add_index "tasks", ["application_id"], name: "index_tasks_on_application_id"
  # add_index "tasks", ["assignee_id"], name: "index_tasks_on_assignee_id"
  # add_index "tasks", ["browser_id"], name: "index_tasks_on_browser_id"
  # add_index "tasks", ["reporter_id"], name: "index_tasks_on_reporter_id"
  # add_index "tasks", ["status_id"], name: "index_tasks_on_status_id"

  # create_table "teams", force: true do |t|
  #   t.string "name"
  # end

  # create_table "users", force: true do |t|
  #   t.string   "first_name"
  #   t.string   "last_name"
  #   t.integer  "role_id"
  #   t.integer  "team_id"
  #   t.integer  "permission_id"
  #   t.string   "username"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

  # add_index "users", ["permission_id"], name: "index_users_on_permission_id"
  # add_index "users", ["role_id"], name: "index_users_on_role_id"
  # add_index "users", ["team_id"], name: "index_users_on_team_id"
