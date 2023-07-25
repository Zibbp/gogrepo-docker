FROM alpine:3.17

ENV PYTHONUNBUFFERED=1

RUN apk add --no-cache python3 git bash
RUN ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -r /root/.cache

RUN git clone https://github.com/eddie3/gogrepo

RUN pip install html5lib html2text
ENTRYPOINT ["/gogrepo/gogrepo.py"]
WORKDIR /srv
