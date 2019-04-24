FROM alpine:3.9 as base
RUN true \ 
        && apk --update --no-cache add --virtual build-deps build-base wget curl \
        && apk --update --no-cache tinydns drill \
        && rm -rf /var/cache/apk/* \
        && apk del build-deps \
        && apk del --virtual build-deps
#FROM base as runner
FROM scratch
COPY --from=$0 /usr/bin/ /usr/bin/
ADD ".tinydns/data" "/tmp/data"
ADD "entrypoint.sh" "/entrypoint.sh"

EXPOSE 53
ENTRYPOINT ["/entrypoint.sh"]