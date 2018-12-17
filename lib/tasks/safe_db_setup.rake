# frozen_string_literal: true

namespace :db do

  desc "Safely setup the DB"
  task safe_setup: :environment do
    ActiveRecord::Tasks::DatabaseTasks.create_current
    if ActiveRecord::SchemaMigration.table_exists?
      puts 'migrating...'
      ActiveRecord::Tasks::DatabaseTasks.migrate
    else
      puts 'creating...'
      ActiveRecord::Tasks::DatabaseTasks.load_schema_current
    end
    puts 'done'
  end
end
