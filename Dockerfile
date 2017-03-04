
FROM templesofsyrinx/dkr-jdk8-sts:3.7.3-001

# Install GraphViz, IceWeasel and lombok
ENV \
    INSTALL_PACKAGES=" \
                       graphviz=2.38.0-7 \
                       iceweasel=45.7.0esr-1~deb8u1 \
                       libcanberra-gtk-module=0.30-2.1 \
                     "

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
            ${INSTALL_PACKAGES} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV \
    LOMBOK_URL=https://projectlombok.org \
    LOMBOK_VERSION=1.16.10

RUN \
    curl ${LOMBOK_URL}/downloads/lombok-${LOMBOK_VERSION}.jar > /tmp/lombok.jar && \
    java -jar /tmp/lombok.jar install ${STS_HOME} && \
    rm /tmp/lombok.jar
 
