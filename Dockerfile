FROM java:openjdk-8-alpine 

WORKDIR /opt

EXPOSE 80

ARG SET_COLOR=blue
ENV COLOR=${SET_COLOR}

COPY target/scala-2.12/app.jar /opt

ENTRYPOINT ["java", "-jar", "/opt/app.jar"]
