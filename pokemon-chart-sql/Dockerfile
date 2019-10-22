FROM microsoft/mssql-server-linux:2017-latest

RUN mkdir -p /opt/app/

WORKDIR /opt/app/
COPY . /opt/app/

CMD ["bash", "/opt/app/entrypoint.sh"]
