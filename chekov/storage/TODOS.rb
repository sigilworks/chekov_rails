
@user.roles >= Role.ADMIN

 - Add creation/updation dates in Task/Comment add/edit popups?

 - TaskPromotionStrategy still needs to have second part implemented:
 	- when Task has Status == NEW,
 	- Assignee changing from Nobody -> one of the User.reals ==> promote!

 - RolePermissionsStrategy implmentation around the .meta options that appear

 - DateTimeFormattingService/-Provider? to hold date/time formatting constants, &c., for uniformity


 - task-stats: express as MetroUI-style, flat/matte-colored heatmap square?

 - make .meta icons darker (maybe opacity: 0.5?)



 - https://github.com/dkubb/equalizer/blob/master/lib/equalizer.rb

-- remove @deprecated in RecentActivityQueue ll. 30,39; using styles below:
FROM:
Session.where(:date_at => date_from..date_to)
       .order("date_at")
       .count("DISTINCT(user_id)", :group => "date(convert_tz(date_at, 'UTC', 'Europe/Warsaw'))")
TO:
Session.where(:date_at => date_from..date_to)
       .select('user_id')
       .distinct
       .group("date(convert_tz(date_at, 'UTC', 'Europe/Warsaw'))")
       .count

 - Error form fields => :indianred

 - Empty out helper methods to controller?

 - Validations on task and comment submissions. Errors