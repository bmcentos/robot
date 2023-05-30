FROM python:3.10-alpine

MAINTAINER Bruno Miquelini (bruno.miquelini@msn.com)
WORKDIR /app
ENV DEPS="\
    curl \
    chromium \
    chromium-chromedriver \
    udev \
    xvfb \
"

COPY . /app

RUN apk update ;\
    apk add --no-cache ${DEPS} ;\
    pip install robot ;\
    pip freeze ;\

    # Cleanup
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "./entrypoint.sh" ]
