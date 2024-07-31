FROM alpine:3.19.1
# hadolint ignore=DL3018
RUN apk add --update --no-cache libintl gettext inotify-tools 
WORKDIR /workdir
COPY watch_changes.sh / 
RUN chmod +x /watch_changes.sh
ENTRYPOINT ["bash", "-c", "while true; do sleep 86400; done"] # to run container continuously 
