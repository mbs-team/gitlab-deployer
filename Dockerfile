FROM node:12.18.2-alpine

RUN \
  apk add bash make py-pip chromium && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev && \
  pip3 install azure-cli && \

RUN which ssh-agent || ( apk add --no-cache openssh-client )

CMD eval `ssh-agent -s`

CMD mkdir -p ~/.ssh

CMD echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

CMD ["bash"]
