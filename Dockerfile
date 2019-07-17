FROM alpine

RUN apk add --update openssh openrc rsync sudo python
RUN ssh-keygen -A
RUN sed -i -e 's/#PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config 
RUN sed -i -e 's/#PermitEmptyPasswords.*/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config 
RUN rc-update add sshd && rc-status && touch /run/openrc/softlevel

EXPOSE 22 873
ENTRYPOINT  /etc/init.d/sshd start && rsync --daemon && sh
