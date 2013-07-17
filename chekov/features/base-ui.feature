
Feature: Base UI Test
	In order to use the application
	As a known user
	I want to ensure the basic UI elements are present

Scenario: Loading the Chekov task list page
	Given there is a known user with username "tpalmer"
	And I am on the main task page
	Then the header menu should have my full name "Timothy Palmer"
	Then the header menu should have my team name "Dev"
	Then there should be a version number posted
	Then the filter menu should default to "@all tasks"
	Then the task stats should display three numbers
	Then there should be a table of one or more task entries
