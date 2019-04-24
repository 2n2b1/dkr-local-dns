FROM alpine:3.9 as base
RUN true \ 
        && apk --update --no-cache add wget curl \
        && apk --update --no-cache add tinydns drill \
        && rm -rf /var/cache/apk/*
#FROM base as runner
FROM scratch
COPY --from=base /usr/bin/ /usr/bin/
ADD ".tinydns/data" "/tmp/data"
ADD "entrypoint.sh" "/entrypoint.sh"

EXPOSE 53
ENTRYPOINT ["/entrypoint.sh"]