FROM filebrowser/filebrowser:v2 as fb

FROM alpine:3.9

RUN apk add --no-cache ca-certificates curl

VOLUME /srv
EXPOSE 80

COPY --from=fb /.filebrowser.json /.filebrowser.json
COPY --from=fb /filebrowser /filebrowser

ENTRYPOINT [ "/filebrowser" ]
