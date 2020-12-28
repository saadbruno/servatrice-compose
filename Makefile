run:
	docker-compose up -d servatrice
run-mysql:
	docker-compose up -d mysql
run-all: run-mysql run 


stop:
	docker-compose stop servatrice 
stop-mysql:
	docker-compose stop mysql
stop-all: stop stop-mysql

restart: stop run 
restart-mysql: stop-mysql run-mysql 
restart-all: stop stop-mysql run-ysql run 

logs:
	docker-compose logs -f servatrice
logs-mysql:
	docker-compose logs -f mysql

manage-mysql:
	docker exec -it servatrice_mysql mysql -u servatrice -ppassword servatrice

# database management:
backup-mysql:
	docker exec -it servatrice_mysql mysqldump -u servatrice -ppassword servatrice | tail -n +2 > ./mysql/backup/servatrice_restore.sql;  cp ./mysql/backup/servatrice_restore.sql ./mysql/backup/servatrice_backup_`date +%Y%m%d_%H%M%S`.sql
restore-mysql:
	cat ./mysql/backup/servatrice_restore.sql | docker exec -i servatrice_mysql mysql -u servatrice -ppassword servatrice 

#aliases
manage-db: manage-mysql
backup-db: backup-mysql 
restore-db: restore-mysql 
