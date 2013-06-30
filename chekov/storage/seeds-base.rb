# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    Application.create([ { name: 'RO' }, { name: 'MDC' }, { name: 'DB' }, { name: 'OTHER' } ])

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
        { name: 'CLOSED', classname: 'closed', description: 'Closed' },
        { name: 'OPEN', classname: 'open', description: 'Open' },
        { name: 'NEW', classname: 'new', description: 'New' },
        { name: 'URGENT', classname: 'urgent', description: 'Urgent' },
        { name: 'REOPENED', classname: 'reopened', description: 'Reopened' },
        { name: 'AWAITING_FEEDBACK', classname: 'awaiting-feedback', description: 'Awaiting Feedback' }
    ])

    Team.create([ { name: 'PRODUCT' }, { name: 'DEVELOPMENT' }, { name: 'OPS' }, { name: 'MGMT' }, { name: 'OTHER' } ])

    User.create( first_name: ' ', last_name: ' ', role_id: 1, team_id: 5, permissions_id: 2, username: 'nobody' )
    User.create( first_name: 'Timothy', last_name: 'Palmer', role_id: 4, team_id: 2, permissions_id: 1, username: 'tpalmer' )
    User.create( first_name: 'David', last_name: 'Landis', role_id: 4, team_id: 2, permissions_id: 1, username: 'dlandis' )
    User.create( first_name: 'Marc', last_name: 'Cassagnol', role_id: 4, team_id: 1, permissions_id: 1, username: 'mcassagnol' )
    User.create( first_name: 'Shimta', last_name: 'Gupta', role_id: 4, team_id: 2, permissions_id: 1, username: 'sgupta' )
    User.create( first_name: 'Gail', last_name: 'Ramos', role_id: 4, team_id: 2, permissions_id: 1, username: 'gramos' )
    User.create( first_name: 'Rajeev', last_name: 'Sethi', role_id: 4, team_id: 1, permissions_id: 1, username: 'rsethi' )
    User.create( first_name: 'Laura', last_name: 'Polak', role_id: 4, team_id: 1, permissions_id: 1, username: 'lpolak' )
    User.create( first_name: 'Remy', last_name: 'Lefebvre', role_id: 4, team_id: 2, permissions_id: 1, username: 'rlefebvre' )