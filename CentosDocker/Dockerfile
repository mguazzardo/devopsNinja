FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd shadow-utils sudo; yum clean all
ADD ./start.sh /start.sh
ADD ./sudoers /etc/sudoers
RUN chmod 755 /start.sh
RUN ./start.sh
ADD ./llave-devops.pub  /home/devops/.ssh/authorized_keys
RUN mkdir /var/run/sshd  && chmod 0700 /home/devops/.ssh && chown -R devops:devops /home/devops/.ssh

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

# EXPOSE 22
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in ; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); rm -f /lib/systemd/system/multi-user.target.wants/; rm -f /etc/systemd/system/.wants/; rm -f /lib/systemd/system/local-fs.target.wants/; rm -f /lib/systemd/system/sockets.target.wants/udev; rm -f /lib/systemd/system/sockets.target.wants/initctl; rm -f /lib/systemd/system/basic.target.wants/; rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
