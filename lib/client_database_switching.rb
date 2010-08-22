module ClientDatabaseSwitching

  # This is prepended to the filter chain for each action and will ensure that on each
  # request, the User is connected to the correct database.
  #
  def choose_database_from_host
    unless defined? @@_client_database_details
      @@_client_database_details = Hash.new
    end
    host = request.host
    if @@_client_database_details[host].nil?
      @@_client_database_details[host] = fetch_client_details_for host
    end
    connect_to_database_for @@_client_database_details[host]
  end

  # Looks in #{RAILS_ROOT}/config/databases for a configuration file which is called
  # #{client_hostname}.yml, which will be a ymlified Hash of the connection details
  # needed to establish a database connection.
  #
  def fetch_client_details_for(client_hostname)
    file_path = "#{RAILS_ROOT}/config/databases/#{client_hostname}.yml"
    if File.exists?(file_path)
      return YAML::load(ERB.new(IO.read(file_path)).result)['database_details']
    end
  end

  # Actually does the work of connecting to the database.
  #
  def connect_to_database_for(details)
    ActiveRecord::Base.establish_connection(details)
  end

end