FROM java:8
MAINTAINER togana "o.togana@gmail.com"

ENV EMBULK_VERSION 0.8.18 
RUN curl -L https://dl.bintray.com/embulk/maven/embulk-${EMBULK_VERSION}.jar -o /usr/local/embulk && \
    chmod +x /usr/local/embulk

WORKDIR /work
RUN /usr/local/embulk gem install embulk-output-elasticsearch
COPY . /work
ENTRYPOINT ["java", "-jar", "/usr/local/embulk"]
CMD ["--help"]
