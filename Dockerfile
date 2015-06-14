FROM alpine:3.2
RUN apk add --update jq py-pip build-base python-dev py-boto openssh git && rm -rf /var/cache/apk/**/
RUN pip install ansible
WORKDIR /src
COPY . /src
RUN ln -fs /dev/null /root/.ash_history
