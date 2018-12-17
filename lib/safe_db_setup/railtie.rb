# frozen_string_literal: true

class SafeDbSetup::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/safe_db_setup.rake'
  end
end
