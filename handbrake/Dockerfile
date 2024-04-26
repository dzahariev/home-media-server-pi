FROM --platform=$BUILDPLATFORM ubuntu:24.04@sha256:562456a05a0dbd62a671c1854868862a4687bf979a96d48ae8e766642cd911e8
RUN apt-get update 
RUN apt install inotify-tools handbrake-cli task-spooler -y

VOLUME [ "/watch", "/process", "/output"]
RUN mkdir app
COPY ./Custom720P.json /app/Custom720P.json
COPY ./process.sh /app/process.sh
RUN chmod +x /app/process.sh

ENTRYPOINT [ "/app/process.sh" ]
