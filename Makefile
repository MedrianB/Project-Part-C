SHELL := /bin/bash

check: 
	find . -type f -name "*.php" -print0 | xargs -0 -n1 php -l

setup-codespace:
	sudo apt update
	sudo apt install mariadb-server mariadb-client
	sudo service mariadb start
	sudo apt install php
	sudo apt install php-mysql

	sudo mysql -u root < sql/schema.sql
	php -m | grep -i mysql || true
	
#	After, run the following
# 	export PATH=/usr/bin:$PATH
