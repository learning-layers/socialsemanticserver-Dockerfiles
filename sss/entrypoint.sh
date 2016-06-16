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
sed -i "s#LAYERS_API_URI#${LAYERS_API_URI}#g" sss.conf.yaml
echo "done --> setting sss config"

echo "sss conf printout ...."
cat sss.conf.yaml

echo "copying resources ..."
cp sss.adapter.rest.v3.dropwizard.jar /sssWorkDir/
cp sss.conf /sssWorkDir/
cp sss.dropwizard.conf.yaml /sssWorkDir/
echo "done copying resources"

echo "starting sss ..."
cd /sssWorkDir/
cp java -jar sss.adapter.rest.v3.dropwizard.jar server sss.dropwizard.conf.yaml
echo "done starting sss"

exec "$@"