
namespace :app do

  namespace :db do
    # usage: `rake app:db:clean`
    desc "This task is to clean the database contents: dumps, creates, migrates, and then re-seeds it"
    task :clean => :environment do
      puts
      puts "Dumping any previous database for this app..."
      Rake::Task['db:drop'].invoke

      puts "Creating database..."
      Rake::Task['db:create'].invoke

      puts "Migrating database schema..."
      Rake::Task['db:migrate'].invoke

      puts "Seeding new database with preloaded data..."
      Rake::Task['db:seed'].invoke
    end
  end # /app:db

  # usage: `rake app:firstrun`
  desc "Setup gems and seeds a new db, for first-run of chekov_rails application"
  task :firstrun do
    puts "Running bundler for first time setup."
    puts "This may take a while..."

    sh "bundle install"
    Rake::Task['app:db:clean'].invoke
  end

end # /app