#!/bin/sh
dpkg -x ~/app/packages/mysql-community-client_5.7.17-1ubuntu14.04_amd64.deb ~/app/mysql/
export PATH=$PATH:~/app/mysql/usr/bin
export LD_LIBRARY_PATH=/home/vcap/app/mysql/usr/lib/x86_64-linux-gnu:/home/vcap/app/.heroku/python/lib:/home/vcap/app/.cloudfoundry/python/lib


export DbLogicalName="cleardb"
export DbHostname=`echo $VCAP_SERVICES | jq -r .$DbLogicalName[0] | jq -r .credentials.hostname`
export     DbPort=`echo $VCAP_SERVICES | jq -r .$DbLogicalName[0] | jq -r .credentials.port`
export     DbName=`echo $VCAP_SERVICES | jq -r .$DbLogicalName[0] | jq -r .credentials.name`
export DbUsername=`echo $VCAP_SERVICES | jq -r .$DbLogicalName[0] | jq -r .credentials.username`
export DbPassword=`echo $VCAP_SERVICES | jq -r .$DbLogicalName[0] | jq -r .credentials.password`

alias connect="mysql --host $DbHostname --database $DbName -u$DbUsername --database $DbName -p$DbPassword"
