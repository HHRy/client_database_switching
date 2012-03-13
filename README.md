Client Database Switching
=========================

How to automatically switch client databases using Rails.

This is the code that accompanies my [Tutorial on the matter][1] and is based on the orignal
solution [Mark Somerville][2] wrote at [PCCL][3] in 2007.


Usage:
------

1. Install as a plugin
2. Create Directory /config/databases in your Rails app root
3. Create /config/databases/localhost.yml in your Rails app root
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
[2]: http://mark.scottishclimbs.com
[3]: http://www.pccl.co.uk
