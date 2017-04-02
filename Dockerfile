FROM java:8
MAINTAINER togana "o.togana@gmail.com"

ENV EMBULK_VERSION 0.8.18 
RUN curl -L https://dl.bintray.com/embulk/maven/embulk-${EMBULK_VERSION}.jar -o /opt/embulk.jar

WORKDIR /work
ENTRYPOINT ["java", "-jar", "/opt/embulk.jar"]
CMD ["--help"]
