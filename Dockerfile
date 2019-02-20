FROM alpine

RUN apk add --update openssh openrc rsync
RUN ssh-keygen -A
RUN sed -i -e 's/#PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config 
RUN sed -i -e 's/#PermitEmptyPasswords.*/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config 
RUN rc-update add sshd && rc-status && touch /run/openrc/softlevel

EXPOSE 22
ENTRYPOINT  /etc/init.d/sshd start && sh
CMD tail -f /dev/null
