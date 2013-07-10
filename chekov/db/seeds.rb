# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    Application.create([ { id: 1, name: 'PUB' }, { id: 2, name: 'CMS' }, { id: 3, name: 'DB' }, { id: 4, name: 'OTHER' } ])

    Browser.create([
        { id: 1, name: 'Internet Explorer (all)', shortname: 'MSIE*' },
        { id: 2, name: 'Internet Explorer 6', shortname: 'MSIE 6' },
        { id: 3, name: 'Internet Explorer 7', shortname: 'MSIE 7' },
        { id: 4, name: 'Internet Explorer 8', shortname: 'MSIE 8' },
        { id: 5, name: 'Internet Explorer 9', shortname: 'MSIE 9' },
        { id: 6, name: 'Internet Explorer 10', shortname: 'MSIE 10' },
        { id: 7, name: 'Internet Explorer 10+', shortname: 'MSIE 10+' },
        { id: 8, name: 'Firefox (all)', shortname: 'FF*' },
        { id: 9, name: 'Firefox < 3.5', shortname: 'FF <3.5' },
        { id: 10, name: 'Firefox < 10', shortname: 'FF <10' },
        { id: 11, name: 'Firefox (current)', shortname: 'FF' },
        { id: 12, name: 'Chrome/Safari (all)', shortname: 'CS*' },
        { id: 13, name: 'Chrome/Safari < 10', shortname: 'CS <10' },
        { id: 14, name: 'Chrome/Safari (current)', shortname: 'CS' },
        { id: 15, name: 'All browsers', shortname: 'ALL' }
    ])

    Permission.create([ { id: 1, name: 'ADMIN' }, { id: 2, name: 'READ_ONLY' }, { id: 3, name: 'ADD_ONLY' } ])

    Role.create([ { id: 1, name: 'ASSIGNEE' }, { id: 2, name: 'REPORTER' }, { id: 3, name: 'COMMENTER' }, { id: 4, name: 'ANY' } ])

    Status.create([
        { id: 1, name: 'CLOSED', shortname: 'closed', description: 'Closed' },
        { id: 2, name: 'OPEN', shortname: 'open', description: 'Open' },
        { id: 3, name: 'NEW', shortname: 'new', description: 'New' },
        { id: 4, name: 'URGENT', shortname: 'urgent', description: 'Urgent' },
        { id: 5, name: 'REOPENED', shortname: 'reopened', description: 'Reopened' },
        { id: 6, name: 'AWAITING_FEEDBACK', shortname: 'awaiting-feedback', description: 'Awaiting Feedback' }
    ])

    Team.create([ { id: 1, name: 'PRODUCT' }, { id: 2, name: 'DEVELOPMENT' }, { id: 3, name: 'OPS' }, { id: 4, name: 'MGMT' }, { id: 5, name: 'OTHER' } ])

    User.create([
    	{ id: 1, first_name: ' ', last_name: ' ', role_id: 1, team_id: 5, permission_id: 2, username: 'nobody' },
    	{ id: 2, first_name: 'Timothy', last_name: 'Palmer', role_id: 4, team_id: 2, permission_id: 1, username: 'tpalmer' },
    	{ id: 3, first_name: 'John', last_name: 'Doe', role_id: 4, team_id: 2, permission_id: 1, username: 'jdoe' },
    	{ id: 4, first_name: 'Jane', last_name: 'Roe', role_id: 4, team_id: 1, permission_id: 1, username: 'jroe' },
    	{ id: 5, first_name: 'Bob', last_name: 'Smith', role_id: 4, team_id: 2, permission_id: 1, username: 'rsmith' },
    	{ id: 6, first_name: 'Justin', last_name: 'Time', role_id: 4, team_id: 2, permission_id: 1, username: 'jtime' },
    	{ id: 7, first_name: 'Justin', last_name: 'Case', role_id: 4, team_id: 1, permission_id: 1, username: 'jcase' }
    ])

    Task.create([
        { id: 1, application_id: 1, build_observed: "b16", description: "Fix the thing that's broken...", bz_id: nil, reporter_id: 2, assignee_id: 2, status_id: 6, browser_id: 15 },
        { id: 2, application_id: 2, build_observed: "b17", description: "This is a description", bz_id: 12345, reporter_id: 2, assignee_id: 7, status_id: 3, browser_id: 8 },
        { id: 3, application_id: 2, build_observed: "b16", description: "And fix the other thing, too!", bz_id: 24567, reporter_id: 2, assignee_id: 2, status_id: 2, browser_id: 1 },
        { id: 4, application_id: 3, build_observed: "b16", description: "The orgs thing isn't working right!", bz_id: 56788, reporter_id: 3, assignee_id: 5, status_id: 4, browser_id: 15 },
        { id: 5, application_id: 1, build_observed: "b17", description: "Keywords selected by user aren't persisted between sessions, even when part of a saved query.  This happens regardless of whether it's a basic search, advanced search, or advanced boolean search!", bz_id: 12345, reporter_id: 5, assignee_id: 1, status_id: 6, browser_id: 12 },
        { id: 6, application_id: 2, build_observed: "b16", description: "I don't know what to write here", bz_id: 34567, reporter_id: 2, assignee_id: 2, status_id: 2, browser_id: 15 },
        { id: 7, application_id: 3, build_observed: "b17", description: "oweiuh weoiwp  qwjiaheiodh ", bz_id: nil, reporter_id: 4, assignee_id: 2, status_id: 2, browser_id: 13 },
        { id: 8, application_id: 4, build_observed: "b17", description: "Why is this thing still broken?!", bz_id: 45789, reporter_id: 2, assignee_id: 2, status_id: 6, browser_id: 10 },
        { id: 9, application_id: 3, build_observed: "b16", description: "This is a description", bz_id: 14678, reporter_id: 6, assignee_id: 4, status_id: 1, browser_id: 15 },
        { id: 10, application_id: 1, build_observed: "b16", description: "This is a description, too! And a bland one at that!", bz_id: nil, reporter_id: 2, assignee_id: 3, status_id: 1, browser_id: 13 }
    ])

