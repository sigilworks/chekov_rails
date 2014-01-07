
@user.roles >= Role.ADMIN

 - Add creation/updation dates in Task/Comment add/edit popups?

 - DateTimeFormattingService/-Provider? to hold date/time formatting constants, &c., for uniformity


 - task-stats: express as MetroUI-style, flat/matte-colored heatmap square?

 - make .meta icons darker (maybe opacity: 0.5?)



 - https://github.com/dkubb/equalizer/blob/master/lib/equalizer.rb

 - Error form fields => :indianred

 - Empty out helper methods to controller?

 - Validations on task and comment submissions. Errors

 - For tasks, add :comments_count using :counter_cache,
   so that each task knows its comments count, and can search against Task based on most/least/none comments...

 - In RecentActivityService, change Proc.new {} to proc do...end