
namespace :app do

  # usage: `rake app:clean`
  desc "This task is to clean the database contents: dumps, creates, migrates, and then re-seeds it"
  task :clean => :environment do
    puts
    puts "Dumping any previous database for this app"
    Rake::Task['db:reset'].invoke

    puts "Creating database..."
    Rake::Task['db:create'].invoke

    puts "Migrating database schema..."
    Rake::Task['db:migrate'].invoke

    puts "Seeding new database with preloaded data..."
    Rake::Task['db:seed'].invoke
  end

end