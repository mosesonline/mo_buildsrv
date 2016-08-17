FROM mosesonline/mo_jenkins:2.18

ARG MAVEN_VERSION
ENV MAVEN_VERSION ${MAVEN_VERSION:-3.3.9}
ENV MAVEN_SHA ${MAVEN_SHA:-5b4c117854921b527ab6190615f9435da730ba05}
ENV MAVEN_HOME /opt/maven

USER root
RUN curl -fsSL http://www-us.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -o /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    && echo "$MAVEN_SHA /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz" | sha1sum -c - \
    && mkdir $MAVEN_HOME && tar -xzf /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz --strip-components=1 -C $MAVEN_HOME

USER jenkins