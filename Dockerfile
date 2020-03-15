ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}

USER root
COPY releases.sh /bin/
RUN chmod 755 /bin/releases.sh

ENTRYPOINT [ "/bin/releases.sh" ]