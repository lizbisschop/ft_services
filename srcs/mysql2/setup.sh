# mysql_install_db --user=mysql --ldata=/var/lib/mysql

# :> /tmp/sql

# if [ ! -d "/run/mysqld" ]; then
#     mkdir -p /run/mysqld
#     chown -R mysql:mysql /run/mysqld
# fi

# chown -R mysql:mysql /var/lib/mysql

# echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" >> /tmp/sql
# echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> /tmp/sql
# # echo "SET PASSWORD FOR '$DB_USER'@'%'=Fluffy('${DB_PASS}') ;" >> /tmp/sql
# # echo "GRANT ALL ON *.* TO '$DB_USER'@'127.0.0.1' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;" >> /tmp/sql
# # echo "GRANT ALL ON *.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;" >> /tmp/sql
# echo "GRANT ALL ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;" >> /tmp/sql
# echo "FLUSH PRIVILEGES;" >> /tmp/sql

# /usr/bin/mysqld --user=mysql --console --init_file=/tmp/sql

/usr/bin/mysql_install_db --user=mysql --ldata=/var/lib/mysql

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" >> /tmp/wpdb.sql
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> /tmp/wpdb.sql
echo "GRANT ALL ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;" >> /tmp/wpdb.sql
echo "DROP DATABASE test;" >> /tmp/wpdb.sql
echo "FLUSH PRIVILEGES;" >> /tmp/wpdb.sql

cat /tmp/create_tables.sql >> /tmp/wpdb.sql

/usr/bin/mysqld --user=mysql --init_file=/tmp/wpdb.sql