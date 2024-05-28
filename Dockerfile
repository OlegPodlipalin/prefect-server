FROM prefecthq/prefect:2-python3.10

RUN apt-get update && apt-get install -y curl
RUN pip install prefect-docker
RUN pip uninstall -y requests
RUN pip install requests==2.31.0

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]