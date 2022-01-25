namespace :db do
  desc 'Prints the migrated versions'
  task schema_migration: :environment do
    puts ActiveRecord::Base.connection.select_values('select version from schema_migrations order by version')
  end
end
