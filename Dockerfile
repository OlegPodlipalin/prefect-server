FROM prefecthq/prefect:2-python3.10

# Install/uninstall additional libraries
RUN apt-get update && apt-get install -y curl
RUN pip install prefect-docker
RUN pip uninstall -y requests
RUN pip install requests==2.31.0

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]