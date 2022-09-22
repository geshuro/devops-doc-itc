
####################################################################################
# Conectarse al servidor bastion devops
####################################################################################
ssh -i "atos-integracam-kp-dev-bastion-devops.pem" ubuntu@10.36.9.104
####################################################################################
ssh  centos@10.36.9.102

vi /var/lib/pgsql/14/data/postgresql.conf
max_connections = '500'

vi /etc/pgbouncer/pgbouncer.ini
[databases]
postgres = host=127.0.0.1 port=5432 dbname=postgres

* = host=127.0.0.1 port=5432

[pgbouncer]
logfile = /var/log/pgbouncer/pgbouncer.log
pidfile = /var/run/pgbouncer/pgbouncer.pid
listen_addr = 10.36.9.102
listen_port = 6432
unix_socket_dir = /var/run/postgresql
auth_type = scram-sha-256
auth_file = /etc/pgbouncer/userlist.txt
admin_users = postgres
ignore_startup_parameters = extra_float_digits,geqo

pool_mode = session
server_reset_query = DISCARD ALL
max_client_conn = 10000
default_pool_size = 20
reserve_pool_size = 1
reserve_pool_timeout = 1
max_db_connections = 1000
pkt_buf = 8192
listen_backlog = 4096

log_connections = 0
log_disconnections = 0




vi /var/log/pgbouncer/pgbouncer.log

bddev/desarrollo@10.36.8.12:59349 pooler error: query_wait_timeout

#conectarse a pgbouncer
psql -p 6432 pgbouncer

Error Connection

/etc/pgbouncer/userlist.txt

psql -p 6432 -U administrador postgres
admin2022
\c postgres
\dt
show pools;

psql -p 6432 -U admin pgbouncer


pgbouncer -R
pgbouncer [-d][-R][-v][-u user] /etc/pgbouncer/pgbouncer.ini
pgbouncer -u administrador /etc/pgbouncer/pgbouncer.ini
pgbouncer -R /etc/pgbouncer/pgbouncer.ini

su - root
pass: admin
su - postgres
psql -p 6432 -U administrador postgres
pass:admin2022
show pools;
SHOW STATS_TOTALS;

psql -U postgres -p 6432 pgbouncer
pass: postgres-pass
SHOW STATS_TOTALS;
show pools;