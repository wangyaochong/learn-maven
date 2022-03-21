#!/bin/bash
dos2unix stop.sh > ../logs/nohup.out 2>&1 &
nohup java -Dspring.config.location=../apps/config/bootstrap.yml,../apps/config/bootstrap-@profile.name@.yml,../apps/config/application.yml,../apps/config/application-@profile.name@.yml -jar ../apps/@build.finalName@.jar 1>> ../logs/nohup.out 2>&1 &