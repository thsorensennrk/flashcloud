FROM flashphonerofficial/webcallserver:latest
ENV LICENSE CD53BD3C-FC56-4E6C-871B-17962394AD66
ENV PASSWORD heiaheia
COPY cert.crt /usr/local/FlashphonerWebCallServer/conf/cert.crt
COPY private.key /usr/local/FlashphonerWebCallServer/conf/.
COPY ca_bundle.crt /usr/local/FlashphonerWebCallServer/conf/.

# Install "software-properties-common" (for the "add-apt-repository")
RUN apt-get update && apt-get install -y \
    software-properties-common

# Add the "JAVA" ppa
RUN add-apt-repository -y \
    ppa:webupd8team/java

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME


COPY build.sh /usr/local/FlashphonerWebCallServer/.
RUN /usr/local/FlashphonerWebCallServer/build.sh
