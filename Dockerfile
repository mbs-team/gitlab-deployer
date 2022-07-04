FROM node:18.3.0-alpine

RUN apk add bash g++ make py-pip chromium libsecret-dev

RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev

RUN pip3 install azure-cli

RUN which ssh-agent || ( apk add --no-cache openssh-client )

CMD eval `ssh-agent -s`

CMD mkdir -p ~/.ssh

CMD echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

CMD cd /var/www

CMD ["bash"]
