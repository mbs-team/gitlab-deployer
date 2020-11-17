FROM node:12.18.2-alpine

RUN \
  apk add bash make py-pip && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev && \
  pip3 install azure-cli && \
  npm install puppeteer@5.4.1 -g

RUN which ssh-agent || ( apk add --no-cache openssh-client )

RUN which bash || ( apk add --no-cache bash )

CMD eval `ssh-agent -s`

CMD mkdir -p ~/.ssh

CMD echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

CMD ["bash"]

