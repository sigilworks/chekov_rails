# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    Application.create([ { name: 'PUB' }, { name: 'CMS' }, { name: 'DB' }, { name: 'OTHER' } ])

    Browser.create([
        { name: 'Internet Explorer (all)', shortname: 'MSIE*' },
        { name: 'Internet Explorer 6', shortname: 'MSIE 6' },
        { name: 'Internet Explorer 7', shortname: 'MSIE 7' },
        { name: 'Internet Explorer 8', shortname: 'MSIE 8' },
        { name: 'Internet Explorer 9', shortname: 'MSIE 9' },
        { name: 'Internet Explorer 10', shortname: 'MSIE 10' },
        { name: 'Internet Explorer 10+', shortname: 'MSIE 10+' },
        { name: 'Firefox (all)', shortname: 'FF*' },
        { name: 'Firefox < 3.5', shortname: 'FF <3.5' },
        { name: 'Firefox < 10', shortname: 'FF <10' },
        { name: 'Firefox (current)', shortname: 'FF' },
        { name: 'Chrome/Safari (all)', shortname: 'CS*' },
        { name: 'Chrome/Safari < 10', shortname: 'CS <10' },
        { name: 'Chrome/Safari (current)', shortname: 'CS' },
        { name: 'All browsers', shortname: 'ALL' }
    ])

    Permission.create([ { name: 'ADMIN' }, { name: 'READ_ONLY' }, { name: 'ADD_ONLY' } ])

    Role.create([ { name: 'ASSIGNEE' }, { name: 'REPORTER' }, { name: 'COMMENTER' }, { name: 'ANY' } ])

    Status.create([
        { name: 'CLOSED', shortname: 'closed', description: 'Closed' },
        { name: 'OPEN', shortname: 'open', description: 'Open' },
        { name: 'NEW', shortname: 'new', description: 'New' },
        { name: 'URGENT', shortname: 'urgent', description: 'Urgent' },
        { name: 'REOPENED', shortname: 'reopened', description: 'Reopened' },
        { name: 'AWAITING_FEEDBACK', shortname: 'awaiting-feedback', description: 'Awaiting Feedback' }
    ])

    Team.create([ { name: 'PRODUCT' }, { name: 'DEVELOPMENT' }, { name: 'OPS' }, { name: 'MGMT' }, { name: 'OTHER' } ])

    User.create( first_name: ' ', last_name: ' ', role_id: 1, team_id: 5, permissions_id: 2, username: 'nobody' )
    User.create( first_name: 'Timothy', last_name: 'Palmer', role_id: 4, team_id: 2, permissions_id: 1, username: 'tpalmer' )
    User.create( first_name: 'John', last_name: 'Doe', role_id: 4, team_id: 2, permissions_id: 1, username: 'jdoe' )
    User.create( first_name: 'Jane', last_name: 'Roe', role_id: 4, team_id: 1, permissions_id: 1, username: 'jroe' )
    User.create( first_name: 'Bob', last_name: 'Smith', role_id: 4, team_id: 2, permissions_id: 1, username: 'rsmith' )
    User.create( first_name: 'Justin', last_name: 'Time', role_id: 4, team_id: 2, permissions_id: 1, username: 'jtime' )
    User.create( first_name: 'Justin', last_name: 'Case', role_id: 4, team_id: 1, permissions_id: 1, username: 'jcase' )
