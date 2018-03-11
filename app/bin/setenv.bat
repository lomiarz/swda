rem -- keystore path
set JAVA_OPTS=%JAVA_OPTS% -Dkeystore.file="conf/cert.jks"
rem -- keystore password
set JAVA_OPTS=%JAVA_OPTS% -Dkeystore.password=lomiarz

rem -- database username
set JAVA_OPTS=%JAVA_OPTS% -Ddb.username=postgres
rem -- database password
set JAVA_OPTS=%JAVA_OPTS% -Ddb.password=postgres
rem -- database url
set JAVA_OPTS=%JAVA_OPTS% -Ddb.url=jdbc:postgresql://localhost:5432/swda
rem -- geoserver connection
set JAVA_OPTS=%JAVA_OPTS% -Dgeoserver.url=http://localhost:8080/geoserver

rem -- geoserver settings (only if installed on the same tomcat instance)
set JAVA_OPTS=%JAVA_OPTS% -DGEOSERVER_HOME="%CATALINA_BASE%"
set JAVA_OPTS=%JAVA_OPTS% -DGEOSERVER_DATA_DIR="%CATALINA_BASE%\geoserver-data"

set JAVA_OPTS=%JAVA_OPTS% -XX:+HeapDumpOnOutOfMemoryError -Xmx1024m
set JAVA_OPTS=%JAVA_OPTS% -XX:+UseParallelOldGC -XX:+UseParallelGC
set JAVA_OPTS=%JAVA_OPTS% -XX:NewRatio=2

echo " dsdsadsadsa %CATALINA_BASE%"

set JAVA_OPTS=%JAVA_OPTS% -Dlog4j.configuration=file:"%CATALINA_BASE%\conf\log4j.properties"