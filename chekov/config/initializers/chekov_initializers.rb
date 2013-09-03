
if AppConfig.enumables.constantize?

  Rails.application.config.before_initialize do |app|
      app.config.paths.add 'app/models/status', :eager_load => true
      app.config.paths.add 'app/models/team', :eager_load => true
      app.config.paths.add 'app/models/permission', :eager_load => true
      app.config.paths.add 'app/models/role', :eager_load => true
      app.config.paths.add 'app/models/application', :eager_load => true
  end

  # Reload cached/serialized classes before every request (in development
  # mode) or on startup (in production mode)
  Rails.application.config.to_prepare do
      require_dependency 'status'
      require_dependency 'team'
      require_dependency 'permission'
      require_dependency 'role'
      require_dependency 'application'
  end

end
