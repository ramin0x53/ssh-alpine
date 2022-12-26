FROM alpine:latest
RUN apk add --update --no-cache openssh 
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/' /etc/ssh/sshd_config
RUN adduser -h /home/vivek -s /bin/sh -D ramin
RUN echo -n 'ramin:ramin321' | chpasswd
ENTRYPOINT ["sh"]
EXPOSE 22
COPY entrypoint.sh /
