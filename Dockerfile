FROM alpine:3.9 as base
RUN apk add --update --nocache \ 
        && curl \
        && tinydns \
        && drill \
        && rm -rf /var/cache/apk/*

FROM scratch

#COPY --from=$0 /usr/bin/curl /usr/bin/curl
#COPY --from=$0 /usr/bin/tinydns /usr/bin/tinydns
#COPY --from=$0 /usr/bin/tinydns-conf /usr/bin/tinydns-conf
#COPY --from=$0 /usr/bin/tinydns-data /usr/bin/tinydns-data
#COPY --from=$0 /usr/bin/tinydns-get /usr/bin/tinydns-get
#COPY --from=$0 /usr/bin/drill /usr/bin/drill
COPY --from=$0 /usr/bin/ /usr/bin/

ADD ".tinydns/data" "/tmp/data"
ADD "entrypoint.sh" "/entrypoint.sh"

EXPOSE 53

ENTRYPOINT ["/entrypoint.sh"];