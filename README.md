# servatrice-compose
Docker compose file to run a Cockatrice Server with a MySQL database

The intention of this repo is to make setting up a Cockatrice server with a database as simple as possible


## Setup:
- Clone the repo
- copy `./Servatrice/servatrice.example.ini` to `./Servatrice/servatrice.ini` and edit it to fit your needs
- Run `make run-mysql` to start the MySQL server
- Run `make run` to start the Servatrice server

**And that's it!** Your Cockatrice server should be up and running! Read along for more details and things you can change / configure.


## Server config:
You can change all the server settings on the `./Servatrice/servatrice.ini` file you copied on the previous Setup setp.

If you want to enable users to have accounts and log in, you have to change a few settings in that file:
- Under the `[authentication]` section, change `method=none` to `method=sql` and `regonly=false` to `regonly=true`
- Under the `[registration]` section, change `enabled=false` to `enabled=true`

It's okay to keep the MySQL "password" since it's only visible from within the docker network and it's not exposed. But if you want to change it, edit both the `docker-compose.yml` and the `Servatrice/servatrice.ini` to match

## Maintenance:
- You can restart the server by running `make restart`, the MySQL db by running `make restart-mysql` and both by running `make restart-all`
- You can backup the database by running `make backup-db` and restore it by running `make restore-db`. All backups are saved to `./mysql/backup/`

---------------

## Servatrice
Cockatrice doesn't have an official Servatrice image, and all the other ones in Docker Hub are outdated. So I built my own, using the default settings [listed in their wiki](https://github.com/Cockatrice/Cockatrice/wiki/Setting-up-Servatrice#2-servatrice-server-build-and-setup).

This image is currently running Servatrice v2.7.6