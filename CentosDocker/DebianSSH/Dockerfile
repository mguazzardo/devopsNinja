FROM debian:9


RUN apt-get update && apt-get install -y \
  openssh-server sudo python python-apt \
  && rm -rf /var/lib/apt/lists/*

ADD ./start.sh /start.sh
ADD ./sudoers /etc/sudoers
RUN chmod 755 /start.sh
RUN ./start.sh
ADD ./llave-devops.pub  /home/devops/.ssh/authorized_keys
RUN mkdir /var/run/sshd  && chmod 0700 /home/devops/.ssh && chown -R devops:devops /home/devops/.ssh && chown -R devops:devops /home/devops && usermod -s /bin/bash devops


EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

