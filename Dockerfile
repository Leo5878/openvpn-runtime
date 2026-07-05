FROM alpine:latest AS openvpn

RUN apk add build-base openssl-dev openssl-libs-static linux-headers libcap-ng-dev tar

COPY build.sh /app/build.sh
RUN /app/build.sh
