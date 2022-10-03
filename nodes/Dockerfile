FROM debian

RUN apt-get update
RUN apt-get install -y ssh net-tools python3
RUN ln -s /usr/bin/python3 /usr/bin/python
COPY node_entry.sh /tmp/node_entry.sh
RUN chmod 711 /tmp/node_entry.sh
COPY sshd_config /etc/ssh/sshd_config.d/sshd_config

ENTRYPOINT [ "/tmp/node_entry.sh" ]