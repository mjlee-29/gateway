
FROM eclipse-temurin:17-jdk

# 현재 리포지토리, api gateway의 코드를 바탕으로 JAR 생성
FROM eclipse-temurin:17-jdk as builder1
ARG JAR_FILE1=build/libs/*.jar
COPY ${JAR_FILE1} app1.jar

# eureka의 리포지토리, eureka server의 코드를 바탕으로 JAR 생성
FROM eclipse-temurin:17-jdk as builder2
ARG JAR_FILE2=eureka/build/libs/*.jar
COPY ${JAR_FILE2} app2.jar

# 최종 이미지 생성
FROM eclipse-temurin:17-jdk
COPY --from=builder1 app1.jar app1.jar
COPY --from=builder2 app2.jar app2.jar

# 두 애플리케이션 모두 실행하는 스크립트 추가
COPY start.sh start.sh
RUN chmod +x start.sh

EXPOSE 8080 8761

ENTRYPOINT ["./start.sh"]