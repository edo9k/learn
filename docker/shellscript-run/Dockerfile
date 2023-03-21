
FROM ubuntu:latest

USER 0

RUN apt -y update && apt -y install ksh zsh csh posh fish bash dash 

WORKDIR /app
COPY ./run.sh /app/run.sh 

ENV command="date" 

ENTRYPOINT /app/run.sh "${command}" 

