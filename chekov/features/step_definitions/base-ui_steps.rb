  # Given there is a known user with username "tpalmer"
  # And I am on the main task page
  # Then the header menu should have my full name "Timothy Palmer"
  # Then the header menu should have my team name "Dev"
  # Then there should be a version number posted
  # Then the filter menu should default to "@all tasks"
  # Then the task stats should display three numbers
  # Then there should be a table of one or more task entries


Given(/^there is a known user with username "(.*?)"$/) do |username|
  # @user = FactoryGirl.create(:user, :username => username)
  @user = User.find(2)
end

Given(/^I am on the main task page$/) do
  visit root_path
end

Then(/^the header menu should have my full name "(.*?)"$/) do |full_name|
  #within("span#welcome") do
    # page.should have_content "#{@user.first_name} #{@user.last_name}"
  page.should have_content "#{@user.first_name} #{@user.last_name}"
  #end
end

Then(/^the header menu should have my team name$/) do
  within("#welcome") do
    # page.should have_content "[ #{team_name} ]"
    page.should have_content "Welcome #{@user.first_name} #{@user.last_name} [ #{@user.team.name[0,3]} ]"
  end
end

Then(/^there should be a version number posted$/) do
  within("h1") do
    find(".app-name").should match /[\d.]+/
  end
end

Then(/^the filter menu should default to "(.*?)"$/) do |filter_name|
  page.has_select? 'status-list', :selected => '@all tasks'
end

Then(/^the task stats should display three numbers$/) do
  within("#stats-open") do
    page.should match /d+/
  end
  within("#stats-attention") do
    page.should match /\d+/
  end
  within("#stats-closed") do
    page.should match /\d+/
  end
end

Then(/^there should be a table of one or more task entries$/) do
  page.has_table? 'task-table'
end