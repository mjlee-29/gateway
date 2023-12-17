#!/bin/bash

# 첫 번째 애플리케이션을 백그라운드에서 실행
java -jar -Dspring.profiles.active=dev app1.jar &

# 두 번째 애플리케이션을 백그라운드에서 실행
java -jar -Dspring.profiles.active=dev app2.jar &

# 모든 자식 프로세스가 종료될 때까지 대기
wait
