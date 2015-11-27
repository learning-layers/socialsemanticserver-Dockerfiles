#!/bin/bash

echo "setting Tomcat SSS config ..."
cd /sss.package/
sed -i "s#SSS_HOST#localhost#g" ./sss.adapter.rest.v2.conf.yaml
sed -i "s#SSS_PORT_FOR_TOMCAT#8390#g" ./sss.adapter.rest.v2.conf.yaml
echo "done --> setting Tomcat SSS config"

echo "deploying SSS REST API to Tomcat with config ..."
cp ./sss.adapter.rest.v2.conf.yaml /usr/local/tomcat/conf/
cp ./sss.adapter.rest.v2.war /usr/local/tomcat/webapps/
echo "done --> deploying SSS REST API to Tomcat with config"

echo "sss api conf printout ...."
cat /usr/local/tomcat/conf/sss.adapter.rest.v2.conf.yaml

echo "setting SSS config ..."
cd /sss.package/sss.app/
sed -i "s#SSS_HOST#localhost#g" ./sss.conf.yaml
sed -i "s#SSS_PORT#8390#g" ./sss.conf.yaml
sed -i "s#SSS_LOCAL_WORK_PATH#${SSS_LOCAL_WORK_PATH}#g" ./sss.conf.yaml
sed -i "s#SSS_MYSQL_HOST#${SSS_MYSQL_HOST}#g" ./sss.conf.yaml
sed -i "s#SSS_MYSQL_PORT#${SSS_MYSQL_PORT}#g" ./sss.conf.yaml
sed -i "s#SSS_MYSQL_USERNAME#${SSS_DB_USER}#g" ./sss.conf.yaml
sed -i "s#SSS_MYSQL_PASSWORD#${SSS_DB_PASS}#g" ./sss.conf.yaml
sed -i "s#SSS_MYSQL_SCHEME#${SSS_DB_NAME}#g" ./sss.conf.yaml
sed -i "s#SSS_SORL_PATH#${SSS_SORL_PATH}#g" ./sss.conf.yaml
sed -i "s#SSS_AUTH_TYPE#${SSS_AUTH_TYPE}#g" ./sss.conf.yaml
sed -i "s#SSS_REST_API_PATH#${SSS_REST_API_PATH}#g" ./sss.conf.yaml
sed -i "s#SSS_TETHYS_USER#${SSS_TETHYS_USER}#g" ./sss.conf.yaml
sed -i "s#SSS_TETHYS_PASSWORD#${SSS_TETHYS_PASSWORD}#g" ./sss.conf.yaml
sed -i "s#SSS_TETHYS_LAS_USER#${SSS_TETHYS_LAS_USER}#g" ./sss.conf.yaml
sed -i "s#SSS_TETHYS_LAS_PASSWORD#${SSS_TETHYS_LAS_PASSWORD}#g" ./sss.conf.yaml
sed -i "s#LAYERS_API_URI#${LAYERS_API_URI}#g" ./sss.conf.yaml
sed -i "s#SSS_EVERNOTE_TEST_AUTH_TOKEN#${SSS_EVERNOTE_TEST_AUTH_TOKEN}#g" ./sss.conf.yaml
sed -i "s#SSS_EVERNOTE_TEST_EMAIL#${SSS_EVERNOTE_TEST_EMAIL}#g" ./sss.conf.yaml
echo "done --> setting SSS config ..."

echo "sss conf printout ...."
cat ./sss.conf.yaml

echo "starting tomcat ..."
/usr/local/tomcat/bin/catalina.sh start

echo "starting SSS ..."
java -jar -Dlog4j.configuration=file:log4j.properties sss.jar

exec "$@"