require 'spec_helper'

describe User do

  my_user = User.find(2)
  all_users_count = User.all.size

  #  CLASS METHODS ------------------------------------------------------------------------------ #

  it "provides access to the `nobody` user" do
    User.nobody.username.should == 'nobody'
  end

  it "knows how to authenticate the existence of valid, existing users" do
    real = my_user.username
    fake = 'abcde'
    User.authenticate(real).should be_a User
    User.authenticate(fake).should be_false
  end

  #  SCOPES ------------------------------------------------------------------------------------- #

  it "returns the users who have task items assigned to them" do
    User.assignees.all? { |u| u.role_ids.include? Role.ASSIGNEE }.should be_true
    User.assignees.size.should be_in 1..all_users_count
  end

  it "returns the users who have reported new task items" do
    User.reporters.all? { |u| u.role_ids.include? Role.REPORTER }.should be_true
    User.reporters.size.should be_in 1..all_users_count
  end

  it "returns the users who have been commenters on task items" do
    User.commenters.all? { |u| u.role_ids.include? Role.COMMENTER }.should be_true
    User.commenters.size.should be_in 1..all_users_count
  end

  it "returns the 'real' (i.e., non-`nobody`) users in the database" do
    reals_count = User.reals.size
    reals_count.should == all_users_count - 1
    User.reals.all? { |u| u != User.nobody }
  end

  #  ASSOCIATIONS ------------------------------------------------------------------------------- #

  it "#commented should return the task items which the user has commented on" do
    tids_by_c = Comment.all.where(:commenter_id => my_user.id).pluck(:task_id)
    tids_by_u = my_user.commented.pluck(:id)
    tids_by_c.should == tids_by_u
  end

  #  INSTANCE METHODS --------------------------------------------------------------------------- #

  it "should return a RolePermissionStrategy object for a user" do
    my_user.able.should be_a RolePermissionsStrategy::RolePermissionsMatrix
  end

  it "knows if a user is the `nobody` user or not" do
    User.nobody.is_nobody?.should be_true
    my_user.is_nobody?.should be_false
  end


end
