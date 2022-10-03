FROM debian

RUN apt-get update
RUN apt-get install -y ssh python3.10 ansible
# RUN python3.10 -m ensurepip --upgrade && python3.10 -m pip install --user ansible
COPY manager_entry.sh /tmp/manager_entry.sh
USER 0
RUN chmod 711 /tmp/manager_entry.sh && /tmp/manager_entry.sh
USER $CONTAINER_USER_ID
COPY playbooks/ .

CMD ["tail", "-f", "/dev/null"]