#!/bin/sh

#mognodump
mongodump --port 27017 -uuser -p 'password' --authenticationDatabase admin -d database -o /the/path/to/output;
sleep 5;
tar -zcvf /the/path/to/output/$(date +%y%m%d).tar.gz /the/path/to/output/database
rm -rf /the/path/to/output/database

#mongoexport
dbs=$(echo "show dbs"|/usr/local/webserver/mongodb26/bin/mongo --port 58017 -uusername -p 'password' --authenticationDatabase admin --shell|grep 'GB$' | awk '{print $1}')
for db in ${dbs}
do
colls=$(echo "db.getCollectionNames()"|/usr/local/webserver/mongodb26/bin/mongo 127.0.0.1:58017/${db} -uusername -p 'password' --authenticationDatabase admin --shell|grep -P '(?<=").*(?=",|"$)'| sed 's/[^0-9a-zA-Z_.]/ /g')
echo ${db}
        for collection in ${colls}
        do
        if [ -d /tmp/bak/${db} ]
        then
                tmp='then'
        else
                mkdir /tmp/bak/${db}
                chmod 755 /tmp/bak/${db}
        fi
        echo ${collection}
        /usr/local/webserver/mongodb26/bin/mongoexport --port 58017 -d ${db} -c ${collection} -uusername -p 'password' --authenticationDatabase admin --sort '{_id: -1}' -limit 10 -o /tmp/bak/${db}/${collection}.json
        done
done
