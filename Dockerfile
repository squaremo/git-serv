FROM sickp/alpine-sshd:latest
RUN apk add --no-cache ca-certificates tini 'git>=2.3.0'

RUN \
    passwd -d root && \
    adduser -D -s /usr/bin/git-shell git && \
    passwd -u git && \
    chown -R git:git /home/git

COPY ./root.pub /root/.ssh/authorized_keys
COPY ./git.pub /home/git/.ssh/authorized_keys

USER git
RUN cd /home/git && mkdir repo && cd repo && git init --bare

USER root
