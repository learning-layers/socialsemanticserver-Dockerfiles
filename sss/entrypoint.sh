#!/bin/bash

echo "create sss work dir ..."
mkdir sssWorkDir
echo "done --> create sss work dir"

echo "setting sss config ..."
cd /sss.package/
sed -i "s#SSS_LOCAL_WORK_PATH#${SSS_LOCAL_WORK_PATH}#g" sss.conf.yaml
sed -i "s#SSS_MYSQL_HOST#${SSS_MYSQL_HOST}#g" sss.conf.yaml
sed -i "s#SSS_MYSQL_PORT#${SSS_MYSQL_PORT}#g" sss.conf.yaml
sed -i "s#SSS_MYSQL_USERNAME#${SSS_DB_USER}#g" sss.conf.yaml
sed -i "s#SSS_MYSQL_PASSWORD#${SSS_DB_PASS}#g" sss.conf.yaml
sed -i "s#SSS_MYSQL_SCHEME#${SSS_DB_NAME}#g" sss.conf.yaml
sed -i "s#SSS_SORL_PATH#${SSS_SORL_PATH}#g" sss.conf.yaml
sed -i "s#SSS_AUTH_TYPE#${SSS_AUTH_TYPE}#g" sss.conf.yaml
sed -i "s#SSS_REST_API_PATH#${SSS_REST_API_PATH}#g" sss.conf.yaml
sed -i "s#SSS_TETHYS_USER#${SSS_TETHYS_USER}#g" sss.conf.yaml
sed -i "s#SSS_TETHYS_PASSWORD#${SSS_TETHYS_PASSWORD}#g" sss.conf.yaml
sed -i "s#SSS_TETHYS_LAS_USER#${SSS_TETHYS_LAS_USER}#g" sss.conf.yaml
sed -i "s#SSS_TETHYS_LAS_PASSWORD#${SSS_TETHYS_LAS_PASSWORD}#g" sss.conf.yaml
sed -i "s#LAYERS_API_URI#${LAYERS_API_URI}#g" sss.conf.yaml
sed -i "s#SSS_EVERNOTE_TEST_AUTH_TOKEN#${SSS_EVERNOTE_TEST_AUTH_TOKEN}#g" sss.conf.yaml
sed -i "s#SSS_EVERNOTE_TEST_EMAIL#${SSS_EVERNOTE_TEST_EMAIL}#g" sss.conf.yaml
cp sss.conf /sssWorkDir/
echo "done --> setting sss config"

echo "sss conf printout ...."
cat sss.conf.yaml

echo "deploying SSS to Tomcat ..."
cp sss.adapter.rest.v3.war /usr/local/tomcat/webapps/
echo "done --> deploying SSS Tomcat"

echo "starting tomcat ..."
/usr/local/tomcat/bin/catalina.sh start

exec "$@"
