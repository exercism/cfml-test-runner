FROM ortussolutions/commandbox:jdk11-3.9.3

WORKDIR /opt/test-runner

# Pre-install box dependencies for offline usage
COPY box.json .
RUN box install

COPY . .

ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
