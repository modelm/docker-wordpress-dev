#!/usr/bin/env sh

mysql_ready='nc -z mysql 3306'

if ! $mysql_ready
then
	printf "Waiting for MySQL."
	while ! $mysql_ready
	do
		printf '.'
		sleep 1
	done
	echo
fi

if wp core is-installed
then
	echo "WordPress is already installed."
	exit
fi

wp core install \
	--url="http://localhost:8080" \
	--title="wordpress" \
	--admin_user="wordpress" \
	--admin_password="wordpress" \
	--admin_email="wordpress@example.com" \
	--skip-email

wp option update permalink_structure "/%postname%/"

wp plugin install --activate query-monitor
