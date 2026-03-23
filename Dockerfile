FROM ortussolutions/boxlang:cli-alpine

WORKDIR /opt/test-runner

# Pre-install testbox and its dependencies for offline usage
RUN bash /usr/local/boxlang/scripts/install-bx-module.sh testbox \
    && bash /usr/local/boxlang/scripts/install-bx-module.sh globber \
    && mkdir -p ~/.boxlang/modules/testbox/system/modules \
    && cp -R ~/.boxlang/modules/globber ~/.boxlang/modules/testbox/system/modules/

COPY . .

ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
