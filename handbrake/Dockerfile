FROM --platform=$BUILDPLATFORM ubuntu:22.04
RUN apt-get update 
RUN apt install inotify-tools handbrake-cli task-spooler -y

VOLUME [ "/watch", "/process", "/output"]
RUN mkdir app
COPY ./Custom720P.json /app/Custom720P.json
COPY ./process.sh /app/process.sh
RUN chmod +x /app/process.sh

ENTRYPOINT [ "/app/process.sh" ]
