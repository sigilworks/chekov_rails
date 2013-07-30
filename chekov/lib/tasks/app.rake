
namespace :app do

  # usage: `rake app:firstrun`
  desc "This task is for first-run ops: runs bundler, sets up and seeds database"
  task :firstrun => :environment do
    puts "Running operations to build app for first time..."

    puts "Creating database..."
    Rake::Task['db:create'].invoke

    puts "Migrating database schema..."
    Rake::Task['db:migrate'].invoke

    puts "Seeding new database with preloaded data..."
    Rake::Task['db:seed'].invoke
  end

end