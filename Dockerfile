FROM alpine:latest
RUN apk add --update --no-cache openssh 
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/' /etc/ssh/sshd_config
RUN adduser -h /home/ramin -s /bin/sh -D ramin
RUN echo -n 'ramin:ramin321' | chpasswd
COPY entrypoint.sh /home
RUN chmod +x /home/entrypoint.sh
ENTRYPOINT ["/home/entrypoint.sh"]
EXPOSE 22
