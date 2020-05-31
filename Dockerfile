# ==================================
# STAGE 1 - build a fat jar
# ==================================
FROM openjdk:8-jdk-alpine

ENV SBT_VERSION 1.2.8
ENV SBT_HOME="/usr/share/sbt"

RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash && \
    cd "/tmp" && \
    wget "https://piccolo.link/sbt-${SBT_VERSION}.tgz" && \
    tar xzf "sbt-${SBT_VERSION}.tgz" && \
    mv "/tmp/sbt" "${SBT_HOME}" && \
    ln -s "${SBT_HOME}/bin/"* "/usr/bin/" && \
    apk del .build-dependencies && \
    rm -rf "/tmp/"*

WORKDIR /app

# Copy all project libraries and build requirements
COPY build.sbt /app/build.sbt
COPY project/plugins.sbt /app/project/plugins.sbt
COPY project/build.properties /app/project/build.properties
RUN sbt update

# Copy the project
COPY app /app/app
COPY conf /app/conf
COPY test /app/test
COPY public /app/public

# Generate a fat jar
RUN sbt assembly

# ==================================
# STAGE 2 - build a slim jar
# ==================================
FROM openjdk:8-jre-alpine

RUN mkdir -p /opt/scala-helloworld
WORKDIR /opt/scala-helloworld
COPY --from=0 /app/target/scala-2.13/scala-play-jenkins-docker-assembly-*.jar scala-helloworld.jar
CMD java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -jar scala-helloworld.jar