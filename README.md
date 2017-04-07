# pcf-mysql-initializer

v0.1 Prototype

Allows for you to run arbitrary SQL on a MySQL datatbase provisioned to Cloud Foundry.



Usage:
Download/clone the repo.
Place your sql/ddl/dumpfiles into the project folder
Modify the setenvs.sh export DbLogicalName to match the name of your bound MySQL Service
cf push this application - it contains a 'hello world' python app [placeholder] with "cf push <appname> -c 'python test.py'" --no-start
cf bind-service <mysql database> <appname>
cf start <appname>
cf ssh <appname>
cd app
. ./setenvs.sh
connect


The 'connect' alias will launch the mysql client from which you can execute arbitrary SQL. The VCAP_SERVICES have been parsed and database credentials extracted into individual exported environment variables.

If you have a SQL file you can execute it directly with;
mysql --host $DbHostname --database $DbName -u$DbUsername --database $DbName -p$DbPassword < mysqlfile.sql

ToDo - 
Parameterize the logical database name

Test modifying the command with which the app is pushed to negate the need to ssh into the container - e.g. 
cf push <appname> -c ". ./setenvs.sh && mysql --host $DbHostname --database $DbName -u$DbUsername --database $DbName -p$DbPassword < mysqlfile.sql && python test.py"

Convert to task

Add procfile / remove python and go to binary buildpack...


