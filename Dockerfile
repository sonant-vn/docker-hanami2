FROM alpine:3.17
EXPOSE 8080/tcp

ARG HANAMI_INST_DIR=/opt/hanami

RUN apk add --no-cache ruby ruby-dev musl-dev libffi-dev alpine-sdk jemalloc

WORKDIR ${HANAMI_INST_DIR}
COPY . .

RUN gem install bundler
RUN bundle install

ENV LD_PRELOAD=/usr/lib/libjemalloc.so.2

CMD ["/usr/bin/bundle", "exec", "hanami", "server", "--port", "8080"]
