
 1. Edit Task
 		- anyone can edit tasks (and shouldnt we track this somewhere?)

 2.	Edit Comment
 		- only admins && commenter can edit comments
 		- only admins && commenter can delete comments
 		(^^ probably need a Permissions/RoleService or -Strategy for these too)

 3. task-stats: express as MetroUI-style, flat/matte-colored heatmap square?

 4.	make .meta icons darker (maybe opacity: 0.5?)


To have launchd start redis at login:
    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
Then to load redis now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
Or, if you don't want/need launchctl, you can just run:
    redis-server /usr/local/etc/redis.conf