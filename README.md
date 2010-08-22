Client Database Switching
=========================

How to automatically switch client databases using Rails.

This is the code that accompanies my [Tutorial on the matter][1].

Usage:
------

1. Install as a plugin
2. Create Directory RAILS_ROOT/config/databases
3. Create RAILS_ROOT/config/databases/localhost.yml
4. With contents:

<pre>
	<%= { "database_details" => ActiveRecord::Base.configurations["development"] }.to_yaml %>
</pre>

Then, add in your Application Controller:

<pre>
	prepend_before_filter :choose_database_from_host
</pre>

YAML File Format
----------------
Databases config files must take the following form:

<pre>
	# Contents of ryanstenhouse.eu.yml
	database_details:
	  adapter: mysql
	  database: client_db_name
	  username: root
	  password:
</pre>

[1]: http://ryanstenhouse.eu/tutorials/2010/02/07/dynamic-database-switching-rails-how-to-do-it/