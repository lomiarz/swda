# Steps to install SWDA:

## 1. Prepare binaries:
- [install postgres (*64bit for Windows*)](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads#windows)
- [install postgis (*64bit for Windows*, use version for postgres you installed in step 1)](http://postgis.net/windows_downloads/)
- [install java JDK (*64bit for Windows*)](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

## 2. Run db scripts:
- psql -h ${db.host} -p ${db.port} -U ${db.username} -a -e -f ${directory}\create-schema.sql
- psql -h ${db.host} -p ${db.port} -U ${db.username} -a -e -c 'create extension postgis'
- psql -h ${db.host} -p ${db.port} -U ${db.username} -d swda -a -e -f ${directory}\swda-schema.sql
- psql -h ${db.host} -p ${db.port} -U ${db.username} -d swda -a -e -f ${directory}\swda-base-data.sql
- psql -h ${db.host} -p ${db.port} -U ${db.username} -d swda -a -e -f ${directory}\zalacznik.sql
- psql -h ${db.host} -p ${db.port} -U ${db.username} -d swda -a -e -f ${directory}\przeds.sql

## 3. Tomcat configuration:
- go to app (folder with tomcat) and check service.bat in bin folder
 - JvmOptions should contain:
 "-Dkeystore.file=conf/cert.jks;
  -Dkeystore.password=lomiarz;
  -Ddb.username=${db.username};
  -Ddb.password=${db.password};
  -Ddb.url=jdbc:postgresql://${db.host}:${db.port}/swda;
  -Dgeoserver.url=http://localhost:${tomcat-http-port}/geoserver;
  -DGEOSERVER_HOME="%CATALINA_BASE%;
  -DGEOSERVER_DATA_DIR="%CATALINA_BASE%\geoserver-data"
  - JvmMx (should be grater than 2048 - 2GB Ram)"

- service.bat install SWDA

## 4. run Tomcat service
- start service in services.msc (Windows service console)

## Access applications:
- [Geoserver](http://localhost:${tomcat-http-port}/geoserver)
- [Spatium SWDA](http://localhost:${tomcat-http-port}/spatium-swda)

## Dictionary for variables (${variable_name)):
- db.host => host of used database
- db.port => port of used database
- db.usersname => database username
- db.password => password form database user
- directory => directory where all the installation scripts are available
