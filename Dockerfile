FROM ortussolutions/commandbox:amd64-jdk8-3.3.0

WORKDIR /opt/test-runner

# Pre-install box dependencies for offline usage
COPY box.json .
RUN box install

COPY . .

ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
