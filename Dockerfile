FROM alpine:3.11

ENV PYTHONUNBUFFERED=1

RUN apk add --no-cache python3 git
RUN python -m ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

RUN git clone https://github.com/eddie3/gogrepo

RUN pip install html5lib html2text
ENTRYPOINT ["/gogrepo/gogrepo.py"]
WORKDIR /srv