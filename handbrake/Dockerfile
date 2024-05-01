FROM --platform=$BUILDPLATFORM ubuntu:22.04
RUN apt-get update 
RUN apt install inotify-tools handbrake-cli task-spooler -y

VOLUME [ "/watch", "/process", "/output"]
RUN mkdir app
COPY ./Custom480P.json /app/Custom480P.json
COPY ./Custom265X480P.json /app/Custom265X480P.json
COPY ./Custom576P.json /app/Custom576P.json
COPY ./Custom265X576P.json /app/Custom265X576P.json
COPY ./Custom720P.json /app/Custom720P.json
COPY ./Custom265X720P.json /app/Custom265X720P.json
COPY ./process.sh /app/process.sh
RUN chmod +x /app/process.sh

ENTRYPOINT [ "/app/process.sh" ]
