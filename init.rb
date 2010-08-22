require File.dirname(__FILE__) + '/lib/client_database_switching.rb'
ActionController::Base.send(:include, ClientDatabaseSwitching)

