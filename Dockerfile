FROM python:3.9-alpine

RUN pip install --quiet --no-cache-dir awscli

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
